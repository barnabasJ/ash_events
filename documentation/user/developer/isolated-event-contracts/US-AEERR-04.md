<!-- SPDX-FileCopyrightText: 2026 ash_events contributors -->
<!-- SPDX-License-Identifier: MIT -->

# US-AEERR-04: raises, keeps earlier events applied and does not apply later events

As a developer, I need the event contract to preserve source behavior and replay
correctness.

Given a stream has valid events before and after an invalid event.

When native replay runs.

Then earlier changes remain applied and later changes are not applied.

Owned by `raises, keeps earlier events applied and does not apply later events`
in `test/ash_events/replay_error_paths_test.exs`.
