<!-- SPDX-FileCopyrightText: 2026 ash_events contributors -->
<!-- SPDX-License-Identifier: MIT -->

# US-AEGEN-01: changeset_generator creates events with proper actor attribution

As a developer, I need the event contract to preserve source behavior and replay
correctness.

Given a changeset generator has a named actor.

When generate executes it.

Then the User event retains its generated email and actor.

Owned by `changeset_generator creates events with proper actor attribution` in
`test/ash_events/generator_test.exs`.
