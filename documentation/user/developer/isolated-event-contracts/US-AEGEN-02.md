<!-- SPDX-FileCopyrightText: 2026 ash_events contributors -->
<!-- SPDX-License-Identifier: MIT -->

# US-AEGEN-02: generate_many creates multiple records with events

As a developer, I need the event contract to preserve source behavior and replay
correctness.

Given a User changeset generator is configured.

When generate_many creates three records.

Then records and their attributed create events exist.

Owned by `generate_many creates multiple records with events` in
`test/ash_events/generator_test.exs`.
