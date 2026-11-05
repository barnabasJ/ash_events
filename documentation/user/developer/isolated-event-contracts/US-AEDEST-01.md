<!-- SPDX-FileCopyrightText: 2026 ash_events contributors -->
<!-- SPDX-License-Identifier: MIT -->

# US-AEDEST-01: creates an event when article is hard deleted

As a developer, I need the event contract to preserve source behavior and replay
correctness.

Given an Article exists.

When hard destroy runs.

Then a destroy event is recorded.

Owned by `creates an event when article is hard deleted` in
`test/ash_events/destroy_action_test.exs`.
