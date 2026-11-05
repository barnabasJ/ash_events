<!-- SPDX-FileCopyrightText: 2026 ash_events contributors -->
<!-- SPDX-License-Identifier: MIT -->

# US-AEACT-02: create action works without an actor

As a developer, I need the event contract to preserve source behavior and replay
correctness.

Given Org creation has no actor option.

When the public action runs.

Then Org exists and both event actor fields are nil.

Owned by `create action works without an actor` in
`test/ash_events/actor_attribution_test.exs`.
