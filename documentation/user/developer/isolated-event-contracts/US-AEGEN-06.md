<!-- SPDX-FileCopyrightText: 2026 ash_events contributors -->
<!-- SPDX-License-Identifier: MIT -->

# US-AEGEN-06: generator with custom attributes creates events correctly

As a developer, I need the event contract to preserve source behavior and replay
correctness.

Given a generator receives email and name overrides.

When generate executes it.

Then the User and event retain those overrides.

Owned by `generator with custom attributes creates events correctly` in
`test/ash_events/generator_test.exs`.
