<!-- SPDX-FileCopyrightText: 2026 ash_events contributors -->
<!-- SPDX-License-Identifier: MIT -->

# US-AECHG-08: as_arguments strategy vs force_change strategy behavior difference

As a developer, I need the event contract to preserve source behavior and replay
correctness.

Given create uses force_change and update uses as_arguments.

When both actions execute and native replay runs.

Then generated slug is recorded outside input data and final state is restored.

Owned by `as_arguments strategy vs force_change strategy behavior difference` in
`test/ash_events/changed_attributes_test.exs`.
