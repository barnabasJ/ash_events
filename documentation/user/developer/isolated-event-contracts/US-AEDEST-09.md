<!-- SPDX-FileCopyrightText: 2026 ash_events contributors -->
<!-- SPDX-License-Identifier: MIT -->

# US-AEDEST-09: metadata is stored in soft delete events

As a developer, I need the event contract to preserve source behavior and replay
correctness.

Given a soft destroy has explicit event metadata.

When the public action runs.

Then its event retains that metadata.

Owned by `metadata is stored in soft delete events` in
`test/ash_events/destroy_action_test.exs`.
