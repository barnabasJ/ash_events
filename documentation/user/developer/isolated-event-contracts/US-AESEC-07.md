<!-- SPDX-FileCopyrightText: 2026 ash_events contributors -->
<!-- SPDX-License-Identifier: MIT -->

# US-AESEC-07: bulk soft destroying a stale record reports the error and does not record an event

As a developer, I need the event contract to preserve source behavior and replay
correctness.

Given an Article has been hard deleted.

When stream bulk soft destroy runs.

Then the bulk result reports StaleRecord without an event.

Owned by
`bulk soft destroying a stale record reports the error and does not record an event`
in `test/ash_events/security_reports_test.exs`.
