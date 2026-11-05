<!-- SPDX-FileCopyrightText: 2026 ash_events contributors -->
<!-- SPDX-License-Identifier: MIT -->

# US-AEDEF-01: update_default values are applied as expected

As a developer, I need the event contract to preserve source behavior and replay
correctness.

Given a User has an initial update timestamp.

When its public update runs.

Then update_default advances the timestamp and the event records it.

Owned by `update_default values are applied as expected` in
`test/ash_events/defaults_test.exs`.
