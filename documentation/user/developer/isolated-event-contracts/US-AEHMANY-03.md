<!-- SPDX-FileCopyrightText: 2026 ash_events contributors -->
<!-- SPDX-License-Identifier: MIT -->

# US-AEHMANY-03: adding and removing children via update, replay works

As a developer, I need the event contract to preserve source behavior and replay
correctness.

Given User has an existing Comment.

When a managed update changes it and adds another then replay runs.

Then the final two comment bodies are restored.

Owned by `adding and removing children via update, replay works` in
`test/ash_events/manage_relationship/has_many_test.exs`.
