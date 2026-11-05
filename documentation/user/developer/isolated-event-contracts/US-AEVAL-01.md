<!-- SPDX-FileCopyrightText: 2026 ash_events contributors -->
<!-- SPDX-License-Identifier: MIT -->

# US-AEVAL-01: atomic changes throws error

As a developer, I need the event contract to preserve source behavior and replay
correctness.

Given a manually wrapped User action declares atomic changes.

When the update and destroy actions run.

Then both reject incompatible atomic changes.

Owned by `atomic changes throws error` in `test/ash_events/validation_test.exs`.
