<!-- SPDX-FileCopyrightText: 2026 ash_events contributors -->
<!-- SPDX-License-Identifier: MIT -->

# US-AECHG-04: changed_attributes are captured during updates

As a developer, I need the event contract to preserve source behavior and replay
correctness.

Given a User exists with an original slug.

When an update changes its name.

Then the new slug is recorded without unchanged status.

Owned by `changed_attributes are captured during updates` in
`test/ash_events/changed_attributes_test.exs`.
