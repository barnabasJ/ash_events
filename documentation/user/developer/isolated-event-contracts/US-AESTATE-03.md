<!-- SPDX-FileCopyrightText: 2026 ash_events contributors -->
<!-- SPDX-License-Identifier: MIT -->

# US-AESTATE-03: upsert behavior with conditional state transitions

As a developer, I need the event contract to preserve source behavior and replay
correctness.

Given an Upload starts skipped without its key.

When upsert supplies that key.

Then the same record transitions to uploaded.

Owned by `upsert behavior with conditional state transitions` in
`test/ash_events/state_machine_test.exs`.
