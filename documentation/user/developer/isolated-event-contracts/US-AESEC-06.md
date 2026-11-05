<!-- SPDX-FileCopyrightText: 2026 ash_events contributors -->
<!-- SPDX-License-Identifier: MIT -->

# US-AESEC-06: bulk destroying a stale record reports the error and does not record a second event

As a developer, I need the event contract to preserve source behavior and replay
correctness.

Given an Article has been hard deleted.

When stream bulk destroy repeats.

Then the bulk result reports StaleRecord without a second event.

Owned by
`bulk destroying a stale record reports the error and does not record a second event`
in `test/ash_events/security_reports_test.exs`.
