<!-- SPDX-FileCopyrightText: 2026 ash_events contributors -->
<!-- SPDX-License-Identifier: MIT -->

# US-AEGEN-05: changeset_generator without actor fails authorization

As a developer, I need the event contract to preserve source behavior and replay
correctness.

Given a User changeset generator has no required actor.

When generate executes it.

Then authorization raises Forbidden.

Owned by `changeset_generator without actor fails authorization` in
`test/ash_events/generator_test.exs`.
