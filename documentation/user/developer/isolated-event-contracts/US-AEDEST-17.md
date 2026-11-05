<!-- SPDX-FileCopyrightText: 2026 ash_events contributors -->
<!-- SPDX-License-Identifier: MIT -->

# US-AEDEST-17: replays multiple articles with mixed delete types

As a developer, I need the event contract to preserve source behavior and replay
correctness.

Given several Articles have different deletion histories.

When native replay runs.

Then each final row matches its hard-delete, soft-delete or retained state.

Owned by `replays multiple articles with mixed delete types` in
`test/ash_events/destroy_action_test.exs`.
