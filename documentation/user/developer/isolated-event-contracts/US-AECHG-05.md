<!-- SPDX-FileCopyrightText: 2026 ash_events contributors -->
<!-- SPDX-License-Identifier: MIT -->

# US-AECHG-05: attributes present in original params are not duplicated in changed_attributes

As a developer, I need the event contract to preserve source behavior and replay
correctness.

Given create input explicitly supplies status.

When the public create action runs.

Then status remains in input data while only the generated slug enters
changed_attributes.

Owned by
`attributes present in original params are not duplicated in changed_attributes`
in `test/ash_events/changed_attributes_test.exs`.
