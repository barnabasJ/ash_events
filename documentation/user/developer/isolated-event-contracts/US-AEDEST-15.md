<!-- SPDX-FileCopyrightText: 2026 ash_events contributors -->
<!-- SPDX-License-Identifier: MIT -->

# US-AEDEST-15: replays soft delete events correctly

As a developer, I need the event contract to preserve source behavior and replay
correctness.

Given an Article was soft deleted.

When native replay runs.

Then the replayed record retains its soft-delete state.

Owned by `replays soft delete events correctly` in
`test/ash_events/destroy_action_test.exs`.
