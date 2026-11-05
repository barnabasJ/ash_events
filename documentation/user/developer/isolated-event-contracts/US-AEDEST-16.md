<!-- SPDX-FileCopyrightText: 2026 ash_events contributors -->
<!-- SPDX-License-Identifier: MIT -->

# US-AEDEST-16: replays archive/unarchive cycle correctly

As a developer, I need the event contract to preserve source behavior and replay
correctness.

Given an Article was archived then unarchived.

When native replay runs.

Then the final Article is unarchived.

Owned by `replays archive/unarchive cycle correctly` in
`test/ash_events/destroy_action_test.exs`.
