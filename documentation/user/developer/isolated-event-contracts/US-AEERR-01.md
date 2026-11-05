<!-- SPDX-FileCopyrightText: 2026 ash_events contributors -->
<!-- SPDX-License-Identifier: MIT -->

# US-AEERR-01: unique constraint violation returns an error and writes no event

As a developer, I need the event contract to preserve source behavior and replay
correctness.

Given a User email already exists.

When a second create uses it.

Then the data-layer error returns without another event.

Owned by `unique constraint violation returns an error and writes no event` in
`test/ash_events/replay_error_paths_test.exs`.
