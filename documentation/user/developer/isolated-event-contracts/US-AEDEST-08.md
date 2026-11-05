<!-- SPDX-FileCopyrightText: 2026 ash_events contributors -->
<!-- SPDX-License-Identifier: MIT -->

# US-AEDEST-08: soft deleted record still exists in database

As a developer, I need the event contract to preserve source behavior and replay
correctness.

Given an Article exists.

When soft destroy runs.

Then the source row remains readable.

Owned by `soft deleted record still exists in database` in
`test/ash_events/destroy_action_test.exs`.
