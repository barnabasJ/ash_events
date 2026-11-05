<!-- SPDX-FileCopyrightText: 2026 ash_events contributors -->
<!-- SPDX-License-Identifier: MIT -->

# US-AEDEF-02: default values work correctly with Events extension

As a developer, I need the event contract to preserve source behavior and replay
correctness.

Given a User create omits automatic timestamps.

When the public create runs.

Then native defaults populate the timestamps and event fields.

Owned by `default values work correctly with Events extension` in
`test/ash_events/defaults_test.exs`.
