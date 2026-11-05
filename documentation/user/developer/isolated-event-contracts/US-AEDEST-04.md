<!-- SPDX-FileCopyrightText: 2026 ash_events contributors -->
<!-- SPDX-License-Identifier: MIT -->

# US-AEDEST-04: events are created in order: create, update, destroy

As a developer, I need the event contract to preserve source behavior and replay
correctness.

Given an Article exists.

When update then destroy run.

Then the persisted sequence is create, update, destroy.

Owned by `events are created in order: create, update, destroy` in
`test/ash_events/destroy_action_test.exs`.
