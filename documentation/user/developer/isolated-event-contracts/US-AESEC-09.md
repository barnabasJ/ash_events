<!-- SPDX-FileCopyrightText: 2026 ash_events contributors -->
<!-- SPDX-License-Identifier: MIT -->

# US-AESEC-09: calling the generated action outside replay fails and writes no event

As a developer, I need the event contract to preserve source behavior and replay
correctness.

Given a User exists outside replay.

When its companion update is called directly.

Then the call fails without changing User or event count.

Owned by `calling the generated action outside replay fails and writes no event`
in `test/ash_events/security_reports_test.exs`.
