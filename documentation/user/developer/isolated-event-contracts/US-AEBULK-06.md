<!-- SPDX-FileCopyrightText: 2026 ash_events contributors -->
<!-- SPDX-License-Identifier: MIT -->

# US-AEBULK-06: bulk_destroy with soft delete works correctly

As a developer, I need the event contract to preserve source behavior and replay
correctness.

Given three Articles exist.

When stream bulk soft destroy runs.

Then all rows have deleted_at and three soft-destroy events exist.

Owned by `bulk_destroy with soft delete works correctly` in
`test/ash_events/bulk_actions_test.exs`.
