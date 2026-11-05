<!-- SPDX-FileCopyrightText: 2026 ash_events contributors -->
<!-- SPDX-License-Identifier: MIT -->

# US-AEGEN-03: multiple generate calls work correctly with events

As a developer, I need the event contract to preserve source behavior and replay
correctness.

Given three generators have distinct actors.

When each generate call executes.

Then all three Users and events exist.

Owned by `multiple generate calls work correctly with events` in
`test/ash_events/generator_test.exs`.
