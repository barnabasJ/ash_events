<!-- SPDX-FileCopyrightText: 2026 ash_events contributors -->
<!-- SPDX-License-Identifier: MIT -->

# US-AEACT-01: actor primary key is persisted

As a developer, I need the event contract to preserve source behavior and replay
correctness.

Given a User and named system actor both update a profile.

When their events are read.

Then user_id and system_actor identify the correct actor exclusively.

Owned by `actor primary key is persisted` in
`test/ash_events/actor_attribution_test.exs`.
