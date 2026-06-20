# SPDX-FileCopyrightText: 2023 ash_events contributors <https://github.com/ash-project/ash_events/graphs/contributors>
#
# SPDX-License-Identifier: MIT

defmodule AshEvents.Events.Changes.RecordEvent do
  @moduledoc """
  Records an event-log row for an action **without** taking over the action with
  a manual wrapper — so the action can stay `require_atomic? true`.

  This is the implementation behind the `events do atomic? true end` mode. Unlike
  the replay-oriented manual wrappers, this is a plain `Ash.Resource.Change`
  modelled on `ash_paper_trail`'s version change: it declares atomic support via
  `atomic/3`, records via `after_action/2` on the non-atomic (single) path and
  via `after_batch/3` on the atomic (bulk) path, and writes the event in the same
  transaction as the action.

  Trade-off (by design): resources in `atomic?` mode are **record-only** — event
  *replay* is not supported for them (the replay machinery — original-PK
  forcing, changed-attribute re-application — is the manual path). Change
  tracking is diff-style: `data` holds the action input params, and
  `changed_attributes` holds attributes present on the resulting record that were
  not part of the input (auto-generated values, attributes set by changes, FKs).
  """

  use Ash.Resource.Change

  alias AshEvents.Events.ActionWrapperHelpers

  @impl true
  def change(changeset, opts, context) do
    actor = context_actor(context)

    Ash.Changeset.after_action(changeset, fn changeset, result ->
      record_event!(changeset, result, opts, actor)
      {:ok, result}
    end)
  end

  @impl true
  def atomic(_changeset, _opts, _context) do
    # Declare atomic compatibility; the event is recorded in after_batch for the
    # atomic (bulk) execution path.
    :ok
  end

  @impl true
  def batch_change(changesets, _opts, _context), do: changesets

  @impl true
  def after_batch([], _opts, _context), do: []

  def after_batch(changesets_and_results, opts, context) do
    actor = context_actor(context)

    Enum.each(changesets_and_results, fn {changeset, result} ->
      record_event!(changeset, result, opts, actor)
    end)

    Enum.map(changesets_and_results, fn {_changeset, result} -> {:ok, result} end)
  end

  defp record_event!(changeset, result, opts, actor) do
    event_log_resource = opts[:event_log]
    [primary_key] = Ash.Resource.Info.primary_key(changeset.resource)
    record_id = Map.get(result, primary_key)

    data = input_data(changeset)
    changed_attributes = changed_attributes(changeset, result, data)
    metadata = Map.get(changeset.context, :ash_events_metadata, %{})
    persist_actor_primary_keys = AshEvents.EventLog.Info.event_log(event_log_resource)

    event_params =
      %{
        data: data,
        record_id: record_id,
        resource: changeset.resource,
        action: opts[:action],
        action_type: changeset.action_type,
        metadata: metadata,
        version: opts[:version] || 1,
        occurred_at: occurred_at(changeset, result, opts),
        changed_attributes: changed_attributes
      }
      |> put_actor_keys(persist_actor_primary_keys, actor)

    event_log_resource
    |> Ash.Changeset.for_create(:create, event_params,
      tenant: changeset.tenant,
      authorize?: false
    )
    |> Ash.create!(authorize?: false)
  end

  # The action input: accepted attributes + arguments, taken from the raw params
  # (available even for atomic actions, where `changeset.attributes` is empty),
  # cast + dumped to a stored form.
  defp input_data(changeset) do
    accept = changeset.action.accept || []
    arg_names = Enum.map(changeset.action.arguments, & &1.name)
    allowed = MapSet.new(accept ++ arg_names)
    params = changeset.params || %{}

    Enum.reduce(params, %{}, fn {key, value}, acc ->
      atom_key = to_existing_atom(key)

      cond do
        atom_key && MapSet.member?(allowed, atom_key) ->
          Map.put(acc, atom_key, dump_input(changeset, atom_key, value))

        true ->
          acc
      end
    end)
  end

  defp dump_input(changeset, key, value) do
    cond do
      attr = Ash.Resource.Info.attribute(changeset.resource, key) ->
        if attr.sensitive?, do: nil, else: ActionWrapperHelpers.dump_value(value, attr)

      arg = Enum.find(changeset.action.arguments, &(&1.name == key)) ->
        if arg.sensitive?, do: nil, else: ActionWrapperHelpers.dump_value(value, arg)

      true ->
        value
    end
  end

  # Attributes present on the resulting record that were not part of the input
  # (auto-generated values, attributes set by changes, belongs_to FKs). Computed
  # from the result so it is correct on both the atomic and non-atomic paths.
  defp changed_attributes(changeset, result, data) do
    input_keys = data |> Map.keys() |> MapSet.new()

    changeset.resource
    |> Ash.Resource.Info.attributes()
    |> Enum.reduce(%{}, fn attr, acc ->
      if MapSet.member?(input_keys, attr.name) or attr.sensitive? do
        acc
      else
        case Map.get(result, attr.name) do
          %Ash.NotLoaded{} -> acc
          nil -> acc
          value -> Map.put(acc, attr.name, ActionWrapperHelpers.dump_value(value, attr))
        end
      end
    end)
  end

  defp occurred_at(changeset, result, opts) do
    case opts[:create_timestamp] || opts[:update_timestamp] do
      nil -> DateTime.utc_now()
      attr -> Map.get(result, attr) || Map.get(changeset.attributes, attr) || DateTime.utc_now()
    end
  end

  defp put_actor_keys(event_params, persist_actor_primary_keys, actor) do
    Enum.reduce(persist_actor_primary_keys, event_params, fn persist, params ->
      if is_struct(actor) and actor.__struct__ == persist.destination do
        pk = Map.get(actor, hd(Ash.Resource.Info.primary_key(actor.__struct__)))
        Map.put(params, persist.name, pk)
      else
        params
      end
    end)
  end

  defp context_actor(%{actor: actor}), do: actor
  defp context_actor(_context), do: nil

  defp to_existing_atom(key) when is_atom(key), do: key

  defp to_existing_atom(key) when is_binary(key) do
    String.to_existing_atom(key)
  rescue
    ArgumentError -> nil
  end
end
