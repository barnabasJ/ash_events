<!-- SPDX-FileCopyrightText: 2026 ash_events contributors -->
<!-- SPDX-License-Identifier: MIT -->

# US-AEPASS-11: password operations with system actors are properly attributed in events

As a developer, I need the event contract to preserve source behavior and replay
correctness.

Given a named system actor performs password operations.

When their event records are read.

Then events retain that actor attribution.

Owned by
`password operations with system actors are properly attributed in events` in
`test/ash_events/ash_authentication_password_test.exs`.
