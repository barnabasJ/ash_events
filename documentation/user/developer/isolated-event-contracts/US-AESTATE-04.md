<!-- SPDX-FileCopyrightText: 2026 ash_events contributors -->
<!-- SPDX-License-Identifier: MIT -->

# US-AESTATE-04: multiple upserts without meeting transition condition keep default state

As a developer, I need the event contract to preserve source behavior and replay
correctness.

Given an Upload starts skipped without its key.

When upsert still omits that key.

Then the same record remains skipped.

Owned by
`multiple upserts without meeting transition condition keep default state` in
`test/ash_events/state_machine_test.exs`.
