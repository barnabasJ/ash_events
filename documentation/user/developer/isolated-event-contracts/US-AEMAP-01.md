<!-- SPDX-FileCopyrightText: 2026 ash_events contributors -->
<!-- SPDX-License-Identifier: MIT -->

# US-AEMAP-01: map arguments are correctly stored in event data

As a developer, I need the event contract to preserve source behavior and replay
correctness.

Given a User update accepts a nested metadata map.

When the public update action runs.

Then its persisted event preserves every nested string, number and boolean.

Owned by `map arguments are correctly stored in event data` in
`test/ash_events/map_arguments_test.exs`.
