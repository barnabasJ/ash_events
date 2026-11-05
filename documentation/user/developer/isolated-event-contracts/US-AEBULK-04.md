<!-- SPDX-FileCopyrightText: 2026 ash_events contributors -->
<!-- SPDX-License-Identifier: MIT -->

# US-AEBULK-04: bulk_destroy works atomically with ignored action

As a developer, I need the event contract to preserve source behavior and replay
correctness.

Given Org destroy is ignored by event tracking.

When atomic bulk destroy runs.

Then three records are removed without ignored-action events.

Owned by `bulk_destroy works atomically with ignored action` in
`test/ash_events/bulk_actions_test.exs`.
