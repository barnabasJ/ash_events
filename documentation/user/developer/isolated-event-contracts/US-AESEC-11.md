<!-- SPDX-FileCopyrightText: 2026 ash_events contributors -->
<!-- SPDX-License-Identifier: MIT -->

# US-AESEC-11: calling the generated action via bulk_update with strategy stream fails and writes no event

As a developer, I need the event contract to preserve source behavior and replay
correctness.

Given a User exists outside replay.

When bulk update calls its companion with the selected strategy.

Then the call fails without changing User or event count.

Owned by
`calling the generated action via bulk_update with strategy stream fails and writes no event`
in `test/ash_events/security_reports_test.exs`.
