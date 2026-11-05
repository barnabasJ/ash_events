<!-- SPDX-FileCopyrightText: 2026 ash_events contributors -->
<!-- SPDX-License-Identifier: MIT -->

# US-AENWID-02: replay works with non-writable UUID after update and destroy

As a developer, I need the event contract to preserve source behavior and replay
correctness.

Given a User with a non-writable UUID is updated.

When native replay runs.

Then the original UUID and updated name are restored.

Owned by `replay works with non-writable UUID after update and destroy` in
`test/ash_events/replay_non_writable_id_test.exs`.
