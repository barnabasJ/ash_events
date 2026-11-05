# SPDX-FileCopyrightText: 2023 ash_events contributors <https://github.com/ash-project/ash_events/graphs/contributors>
#
# SPDX-License-Identifier: MIT

defmodule AshEvents.TestNotifier do
  @moduledoc """
  Sends each native notification back to the process that dispatches it.
  """
  use Ash.Notifier

  @impl Ash.Notifier
  @spec notify(notification :: Ash.Notifier.Notification.t()) :: :ok
  def notify(notification) do
    send(notification.from, {:notified, notification})

    :ok
  end
end
