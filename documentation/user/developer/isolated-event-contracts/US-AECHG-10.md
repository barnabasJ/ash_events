<!-- SPDX-FileCopyrightText: 2026 ash_events contributors -->
<!-- SPDX-License-Identifier: MIT -->

# US-AECHG-10: as_arguments strategy would fail if required argument is not provided during replay

As a developer, I need the event contract to preserve source behavior and replay
correctness.

Given an update event omits its required slug.

When native replay runs.

Then Invalid reports the missing slug argument.

Owned by
`as_arguments strategy would fail if required argument is not provided during replay`
in `test/ash_events/changed_attributes_test.exs`.
