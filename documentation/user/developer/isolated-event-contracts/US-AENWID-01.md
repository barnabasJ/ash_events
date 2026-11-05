<!-- SPDX-FileCopyrightText: 2026 ash_events contributors -->
<!-- SPDX-License-Identifier: MIT -->

# US-AENWID-01: replay works with non-writable UUID primary key

As a developer, I need the event contract to preserve source behavior and replay
correctness.

Given a User action does not accept its generated UUID.

When create and native replay run.

Then the same UUID, email and name are restored.

Owned by `replay works with non-writable UUID primary key` in
`test/ash_events/replay_non_writable_id_test.exs`.
