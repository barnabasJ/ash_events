<!-- SPDX-FileCopyrightText: 2026 ash_events contributors -->
<!-- SPDX-License-Identifier: MIT -->

# US-AEHMANY-01: creates parent with multiple children, separate events for each

As a developer, I need the event contract to preserve source behavior and replay
correctness.

Given User create includes two managed Comments.

When the public action runs.

Then one User and two Comment events are recorded.

Owned by `creates parent with multiple children, separate events for each` in
`test/ash_events/manage_relationship/has_many_test.exs`.
