<!-- SPDX-FileCopyrightText: 2026 ash_events contributors -->
<!-- SPDX-License-Identifier: MIT -->

# US-AEDEST-11: archive sets archived_at on the record

As a developer, I need the event contract to preserve source behavior and replay
correctness.

Given an Article exists.

When archive runs.

Then archived_at is set.

Owned by `archive sets archived_at on the record` in
`test/ash_events/destroy_action_test.exs`.
