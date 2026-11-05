<!-- SPDX-FileCopyrightText: 2026 ash_events contributors -->
<!-- SPDX-License-Identifier: MIT -->

# US-AEVAL-03: only_actions works as expected

As a developer, I need the event contract to preserve source behavior and replay
correctness.

Given OrgDetails limits event tracking to named actions.

When the compiled action metadata is inspected.

Then only the selected actions have manual event wrappers.

Owned by `only_actions works as expected` in
`test/ash_events/validation_test.exs`.
