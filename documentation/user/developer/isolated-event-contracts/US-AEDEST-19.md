<!-- SPDX-FileCopyrightText: 2026 ash_events contributors -->
<!-- SPDX-License-Identifier: MIT -->

# US-AEDEST-19: no duplicate events created during soft delete replay

As a developer, I need the event contract to preserve source behavior and replay
correctness.

Given a soft-destroy stream exists.

When native replay runs.

Then replay creates no duplicate events.

Owned by `no duplicate events created during soft delete replay` in
`test/ash_events/destroy_action_test.exs`.
