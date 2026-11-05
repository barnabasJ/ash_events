# SPDX-FileCopyrightText: 2023 ash_events contributors <https://github.com/ash-project/ash_events/graphs/contributors>
#
# SPDX-License-Identifier: MIT

defmodule AshEvents.Events.Changes.RecordEvent do
  @moduledoc """
  Adapts successful atomic-capable actions to the native shared event recorder.

  The original changeset supplies input, scope and metadata. The final record
  supplies evaluated values. Separate private actions handle replay.
  """
  use Ash.Resource.Change

  alias AshEvents.Events.ActionWrapperHelpers

  @impl Ash.Resource.Change
  @spec change(
          changeset :: Ash.Changeset.t(),
          opts :: ActionWrapperHelpers.event_options(),
          context :: Ash.Resource.Change.Context.t()
        ) :: Ash.Changeset.t()
  def change(changeset, opts, context) do
    Ash.Changeset.after_action(changeset, fn changeset, result ->
      notifications = record_event!(changeset, result, opts, context)
      {:ok, result, notifications}
    end)
  end

  @impl Ash.Resource.Change
  @spec atomic(
          changeset :: Ash.Changeset.t(),
          opts :: ActionWrapperHelpers.event_options(),
          context :: Ash.Resource.Change.Context.t()
        ) :: :ok
  def atomic(_changeset, _opts, _context), do: :ok

  @impl Ash.Resource.Change
  @spec batch_change(
          changesets :: [Ash.Changeset.t()],
          opts :: ActionWrapperHelpers.event_options(),
          context :: Ash.Resource.Change.Context.t()
        ) :: [Ash.Changeset.t()]
  def batch_change(changesets, _opts, _context), do: changesets

  @impl Ash.Resource.Change
  @spec after_batch(
          changesets_and_results :: [{Ash.Changeset.t(), Ash.Resource.Record.t()}],
          opts :: ActionWrapperHelpers.event_options(),
          context :: Ash.Resource.Change.Context.t()
        ) ::
          list({:ok, Ash.Resource.Record.t()} | Ash.Notifier.Notification.t())
  def after_batch(changesets_and_results, opts, context) do
    Enum.flat_map(changesets_and_results, fn {changeset, result} ->
      [{:ok, result} | record_event!(changeset, result, opts, context)]
    end)
  end

  defp record_event!(changeset, result, opts, context) do
    action_opts = context |> Ash.Context.to_opts() |> Keyword.put(:tenant, changeset.tenant)

    original_params =
      case Map.fetch(Map.get(changeset.context, :private, %{}), :ash_events_original_params) do
        {:ok, captured} -> captured
        :error -> changeset.params || %{}
      end

    ActionWrapperHelpers.create_event!(
      changeset,
      original_params,
      occurred_at(changeset, result, opts),
      opts,
      action_opts,
      result
    )
  end

  defp occurred_at(changeset, result, opts) do
    timestamp =
      case changeset.action_type do
        :create -> opts[:create_timestamp]
        :update -> opts[:update_timestamp]
        :destroy -> nil
      end

    if timestamp, do: Map.get(result, timestamp) || DateTime.utc_now(), else: DateTime.utc_now()
  end
end
