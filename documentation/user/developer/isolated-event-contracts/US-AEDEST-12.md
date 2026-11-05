<!-- SPDX-FileCopyrightText: 2026 ash_events contributors -->
<!-- SPDX-License-Identifier: MIT -->

# US-AEDEST-12: unarchive clears archived_at

As a developer, I need the event contract to preserve source behavior and replay
correctness.

Given an Article is archived.

When unarchive runs.

Then archived_at becomes nil.

Owned by `unarchive clears archived_at` in
`test/ash_events/destroy_action_test.exs`.
