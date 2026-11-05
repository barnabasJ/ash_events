<!-- SPDX-FileCopyrightText: 2026 ash_events contributors -->
<!-- SPDX-License-Identifier: MIT -->

# US-AEDEST-03: hard delete event stores the correct record_id

As a developer, I need the event contract to preserve source behavior and replay
correctness.

Given an Article exists.

When hard destroy runs.

Then the event retains its original record ID.

Owned by `hard delete event stores the correct record_id` in
`test/ash_events/destroy_action_test.exs`.
