<!-- SPDX-FileCopyrightText: 2026 ash_events contributors -->
<!-- SPDX-License-Identifier: MIT -->

# US-AEBULK-07: bulk_destroy with soft delete and nested bulk operation works correctly

As a developer, I need the event contract to preserve source behavior and replay
correctness.

Given three tagged Articles exist.

When bulk soft destroy performs a nested join destroy.

Then source rows are soft-deleted, joins disappear and three source events
exist.

Owned by
`bulk_destroy with soft delete and nested bulk operation works correctly` in
`test/ash_events/bulk_actions_test.exs`.
