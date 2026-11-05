<!-- SPDX-FileCopyrightText: 2026 ash_events contributors -->
<!-- SPDX-License-Identifier: MIT -->

# US-AEVAL-05: replay events handles routed actions correctly

As a developer, I need the event contract to preserve source behavior and replay
correctness.

Given a User create event routes to two resources.

When native replay runs.

Then both User and RoutedUser contain the original names.

Owned by `replay events handles routed actions correctly` in
`test/ash_events/validation_test.exs`.
