<!-- SPDX-FileCopyrightText: 2026 ash_events contributors -->
<!-- SPDX-License-Identifier: MIT -->

# US-AEACT-03: update action works without an actor

As a developer, I need the event contract to preserve source behavior and replay
correctness.

Given Org update has no actor option.

When the public action runs.

Then the updated event has nil actor fields.

Owned by `update action works without an actor` in
`test/ash_events/actor_attribution_test.exs`.
