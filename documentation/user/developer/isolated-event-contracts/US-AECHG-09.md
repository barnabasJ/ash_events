<!-- SPDX-FileCopyrightText: 2026 ash_events contributors -->
<!-- SPDX-License-Identifier: MIT -->

# US-AECHG-09: as_arguments strategy passes changed_attributes as required arguments during replay

As a developer, I need the event contract to preserve source behavior and replay
correctness.

Given an update event supplies required slug through changed_attributes.

When native replay runs.

Then the required argument receives custom-slug and restores the User.

Owned by
`as_arguments strategy passes changed_attributes as required arguments during replay`
in `test/ash_events/changed_attributes_test.exs`.
