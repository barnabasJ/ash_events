<!-- SPDX-FileCopyrightText: 2026 ash_events contributors -->
<!-- SPDX-License-Identifier: MIT -->

# US-AEDEST-06: creates an event when article is soft deleted

As a developer, I need the event contract to preserve source behavior and replay
correctness.

Given an Article exists.

When soft destroy runs.

Then a soft-destroy event is recorded.

Owned by `creates an event when article is soft deleted` in
`test/ash_events/destroy_action_test.exs`.
