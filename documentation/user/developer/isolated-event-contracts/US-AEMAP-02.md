<!-- SPDX-FileCopyrightText: 2026 ash_events contributors -->
<!-- SPDX-License-Identifier: MIT -->

# US-AEMAP-02: nil map arguments are handled correctly

As a developer, I need the event contract to preserve source behavior and replay
correctness.

Given a User update accepts an optional map.

When the public action omits that argument.

Then its persisted event retains a nil map value.

Owned by `nil map arguments are handled correctly` in
`test/ash_events/map_arguments_test.exs`.
