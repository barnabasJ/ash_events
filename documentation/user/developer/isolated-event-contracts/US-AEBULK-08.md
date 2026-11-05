<!-- SPDX-FileCopyrightText: 2026 ash_events contributors -->
<!-- SPDX-License-Identifier: MIT -->

# US-AEBULK-08: single create without return_notifications? should work fine

As a developer, I need the event contract to preserve source behavior and replay
correctness.

Given one Org create does not request notifications.

When the public create action runs.

Then the source ID and its event exist.

Owned by `single create without return_notifications? should work fine` in
`test/ash_events/bulk_actions_test.exs`.
