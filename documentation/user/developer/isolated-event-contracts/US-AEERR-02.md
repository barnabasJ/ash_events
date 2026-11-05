<!-- SPDX-FileCopyrightText: 2026 ash_events contributors -->
<!-- SPDX-License-Identifier: MIT -->

# US-AEERR-02: a validation with a custom message fails replay with that message

As a developer, I need the event contract to preserve source behavior and replay
correctness.

Given an unarchive stream lacks its archive event.

When native replay runs.

Then the custom Article is not archived validation message returns.

Owned by `a validation with a custom message fails replay with that message` in
`test/ash_events/replay_error_paths_test.exs`.
