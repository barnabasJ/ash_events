<!-- SPDX-FileCopyrightText: 2026 ash_events contributors -->
<!-- SPDX-License-Identifier: MIT -->

# US-AEVAL-02: replay events on event log missing clear function throws RuntimeError

As a developer, I need the event contract to preserve source behavior and replay
correctness.

Given an event log has no clear-records callback.

When its public replay action runs.

Then Ash returns an Unknown error.

Owned by `replay events on event log missing clear function throws RuntimeError`
in `test/ash_events/validation_test.exs`.
