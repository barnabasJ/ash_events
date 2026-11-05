<!-- SPDX-FileCopyrightText: 2026 ash_events contributors -->
<!-- SPDX-License-Identifier: MIT -->

# US-AEERR-05: update and destroy events for a missing record log a warning and replay continues

As a developer, I need the event contract to preserve source behavior and replay
correctness.

Given update and destroy events lack their create event.

When native replay runs.

Then warnings identify the missing records and the surviving Article is
restored.

Owned by
`update and destroy events for a missing record log a warning and replay continues`
in `test/ash_events/replay_error_paths_test.exs`.
