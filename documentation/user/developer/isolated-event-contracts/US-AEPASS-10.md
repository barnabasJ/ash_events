<!-- SPDX-FileCopyrightText: 2026 ash_events contributors -->
<!-- SPDX-License-Identifier: MIT -->

# US-AEPASS-10: password authentication events can be replayed correctly

As a developer, I need the event contract to preserve source behavior and replay
correctness.

Given password operations produced events.

When native replay runs.

Then User state and authentication history are restored.

Owned by `password authentication events can be replayed correctly` in
`test/ash_events/ash_authentication_password_test.exs`.
