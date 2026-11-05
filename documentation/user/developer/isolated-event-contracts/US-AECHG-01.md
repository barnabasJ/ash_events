<!-- SPDX-FileCopyrightText: 2026 ash_events contributors -->
<!-- SPDX-License-Identifier: MIT -->

# US-AECHG-01: changed_attributes are stored in events

As a developer, I need the event contract to preserve source behavior and replay
correctness.

Given UserWithAutoAttrs generates status and slug.

When its create action runs.

Then generated fields appear in changed_attributes and input fields remain in
data.

Owned by `changed_attributes are stored in events` in
`test/ash_events/changed_attributes_test.exs`.
