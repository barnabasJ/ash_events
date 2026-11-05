<!-- SPDX-FileCopyrightText: 2026 ash_events contributors -->
<!-- SPDX-License-Identifier: MIT -->

# US-AEDEST-02: hard delete removes the record from the database

As a developer, I need the event contract to preserve source behavior and replay
correctness.

Given an Article exists.

When hard destroy runs.

Then the source record is absent.

Owned by `hard delete removes the record from the database` in
`test/ash_events/destroy_action_test.exs`.
