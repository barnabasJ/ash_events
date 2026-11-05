<!-- SPDX-FileCopyrightText: 2026 ash_events contributors -->
<!-- SPDX-License-Identifier: MIT -->

# US-AEERR-03: a validation without a custom message fails replay with the default message

As a developer, I need the event contract to preserve source behavior and replay
correctness.

Given a stored Org event has an invalid short name.

When native replay runs.

Then the default name-length validation error returns.

Owned by
`a validation without a custom message fails replay with the default message` in
`test/ash_events/replay_error_paths_test.exs`.
