<!-- SPDX-FileCopyrightText: 2026 ash_events contributors -->
<!-- SPDX-License-Identifier: MIT -->

# US-AEUPS-02: auto-generated replay update action is created for upsert actions

As a developer, I need the event contract to preserve source behavior and replay
correctness.

Given User has a tracked upsert.

When compiled actions are inspected.

Then the generated replay update accepts original fields and is not primary.

Owned by `auto-generated replay update action is created for upsert actions` in
`test/ash_events/upsert_test.exs`.
