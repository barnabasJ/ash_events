<!-- SPDX-FileCopyrightText: 2026 ash_events contributors -->
<!-- SPDX-License-Identifier: MIT -->

# US-AEACT-04: create action works with actor explicitly set to nil

As a developer, I need the event contract to preserve source behavior and replay
correctness.

Given Org creation explicitly passes actor nil.

When the public action runs.

Then the event has nil actor fields.

Owned by `create action works with actor explicitly set to nil` in
`test/ash_events/actor_attribution_test.exs`.
