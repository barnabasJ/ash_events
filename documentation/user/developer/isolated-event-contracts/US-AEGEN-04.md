<!-- SPDX-FileCopyrightText: 2026 ash_events contributors -->
<!-- SPDX-License-Identifier: MIT -->

# US-AEGEN-04: seed_generator bypasses events (no events created)

As a developer, I need the event contract to preserve source behavior and replay
correctness.

Given a seed generator bypasses actions.

When generate seeds a User.

Then no new event is created.

Owned by `seed_generator bypasses events (no events created)` in
`test/ash_events/generator_test.exs`.
