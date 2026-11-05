<!-- SPDX-FileCopyrightText: 2026 ash_events contributors -->
<!-- SPDX-License-Identifier: MIT -->

# US-AEVAL-04: handles validation modules in wrapper gracefully

As a developer, I need the event contract to preserve source behavior and replay
correctness.

Given Org validates name length.

When valid and one-character names are submitted.

Then valid creation succeeds and invalid creation names the name field.

Owned by `handles validation modules in wrapper gracefully` in
`test/ash_events/validation_test.exs`.
