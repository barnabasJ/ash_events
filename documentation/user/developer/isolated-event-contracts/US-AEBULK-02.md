<!-- SPDX-FileCopyrightText: 2026 ash_events contributors -->
<!-- SPDX-License-Identifier: MIT -->

# US-AEBULK-02: bulk_create works atomically with ignored action

As a developer, I need the event contract to preserve source behavior and replay
correctness.

Given Org create is ignored by event tracking.

When atomic bulk create runs.

Then three records exist without ignored-action events.

Owned by `bulk_create works atomically with ignored action` in
`test/ash_events/bulk_actions_test.exs`.
