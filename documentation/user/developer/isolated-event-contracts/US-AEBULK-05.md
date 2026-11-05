<!-- SPDX-FileCopyrightText: 2026 ash_events contributors -->
<!-- SPDX-License-Identifier: MIT -->

# US-AEBULK-05: bulk_create without return_notifications? should not generate missed notification warnings

As a developer, I need the event contract to preserve source behavior and replay
correctness.

Given bulk Org creation does not request notifications.

When the public bulk action runs.

Then both source records and both events exist.

Owned by
`bulk_create without return_notifications? should not generate missed notification warnings`
in `test/ash_events/bulk_actions_test.exs`.
