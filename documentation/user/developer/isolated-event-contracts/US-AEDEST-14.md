<!-- SPDX-FileCopyrightText: 2026 ash_events contributors -->
<!-- SPDX-License-Identifier: MIT -->

# US-AEDEST-14: replays hard delete events correctly

As a developer, I need the event contract to preserve source behavior and replay
correctness.

Given an Article was hard deleted.

When native replay runs.

Then the replayed final record remains absent.

Owned by `replays hard delete events correctly` in
`test/ash_events/destroy_action_test.exs`.
