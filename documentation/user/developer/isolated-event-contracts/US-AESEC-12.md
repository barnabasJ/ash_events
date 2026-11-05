<!-- SPDX-FileCopyrightText: 2026 ash_events contributors -->
<!-- SPDX-License-Identifier: MIT -->

# US-AESEC-12: the generated action still runs when invoked with the replay marker

As a developer, I need the event contract to preserve source behavior and replay
correctness.

Given a User exists with trusted replay context.

When its companion update runs.

Then the User name changes to Replayed.

Owned by `the generated action still runs when invoked with the replay marker`
in `test/ash_events/security_reports_test.exs`.
