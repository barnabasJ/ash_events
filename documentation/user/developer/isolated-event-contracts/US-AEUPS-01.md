<!-- SPDX-FileCopyrightText: 2026 ash_events contributors -->
<!-- SPDX-License-Identifier: MIT -->

# US-AEUPS-01: upsert action generates events correctly for both create and update paths

As a developer, I need the event contract to preserve source behavior and replay
correctness.

Given two upserts use one User email.

When native actions and replay run.

Then both events retain their input and one final updated User is restored.

Owned by
`upsert action generates events correctly for both create and update paths` in
`test/ash_events/upsert_test.exs`.
