<!-- SPDX-FileCopyrightText: 2026 ash_events contributors -->
<!-- SPDX-License-Identifier: MIT -->

# US-AEVAL-06: before_action?: true delays a validation on a tracked action

As a developer, I need the event contract to preserve source behavior and replay
correctness.

Given a tracked create deactivates Org in before_action.

When a deferred active-state validation runs.

Then the action succeeds with active false.

Owned by `before_action?: true delays a validation on a tracked action` in
`test/ash_events/validation_test.exs`.
