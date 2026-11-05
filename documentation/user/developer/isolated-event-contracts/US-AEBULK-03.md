<!-- SPDX-FileCopyrightText: 2026 ash_events contributors -->
<!-- SPDX-License-Identifier: MIT -->

# US-AEBULK-03: bulk_update works atomically with ignored action

As a developer, I need the event contract to preserve source behavior and replay
correctness.

Given Org update is ignored by event tracking.

When atomic bulk update runs.

Then three records change without ignored-action events.

Owned by `bulk_update works atomically with ignored action` in
`test/ash_events/bulk_actions_test.exs`.
