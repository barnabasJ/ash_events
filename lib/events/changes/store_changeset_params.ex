# SPDX-FileCopyrightText: 2023 ash_events contributors <https://github.com/ash-project/ash_events/graphs/contributors>
#
# SPDX-License-Identifier: MIT

defmodule AshEvents.Events.Changes.StoreChangesetParams do
  @moduledoc false
  use Ash.Resource.Change

  @typedoc "Options for extension-owned transient input capture."
  @type options :: [private?: boolean()]

  @impl Ash.Resource.Change
  @spec change(
          changeset :: Ash.Changeset.t(),
          opts :: options(),
          context :: Ash.Resource.Change.Context.t()
        ) :: Ash.Changeset.t()
  def change(changeset, opts, _context) do
    if Keyword.get(opts, :private?, false) do
      # Extension-owned transient input must stay outside public changeset inspection.
      Ash.Changeset.set_context(changeset, %{
        private: %{ash_events_original_params: changeset.params || %{}}
      })
    else
      Ash.Changeset.set_context(changeset, %{original_params: changeset.params})
    end
  end

  @impl Ash.Resource.Change
  @spec atomic(
          changeset :: Ash.Changeset.t(),
          opts :: options(),
          context :: Ash.Resource.Change.Context.t()
        ) :: {:ok, Ash.Changeset.t()}
  def atomic(changeset, opts, context) do
    {:ok, change(changeset, opts, context)}
  end
end
