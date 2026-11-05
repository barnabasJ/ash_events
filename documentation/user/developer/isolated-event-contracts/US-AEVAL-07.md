<!-- SPDX-FileCopyrightText: 2026 ash_events contributors -->
<!-- SPDX-License-Identifier: MIT -->

# US-AEVAL-07: before_action?: true behaves the same on tracked and ignored actions

As a developer, I need the event contract to preserve source behavior and replay
correctness.

Given tracked and ignored actions share a deferred validation.

When both create actions run.

Then both return active false.

Owned by `before_action?: true behaves the same on tracked and ignored actions`
in `test/ash_events/validation_test.exs`.
