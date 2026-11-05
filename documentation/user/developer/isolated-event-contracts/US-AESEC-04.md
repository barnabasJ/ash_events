<!-- SPDX-FileCopyrightText: 2026 ash_events contributors -->
<!-- SPDX-License-Identifier: MIT -->

# US-AESEC-04: destroying a stale record returns an error and does not record a second destroy event

As a developer, I need the event contract to preserve source behavior and replay
correctness.

Given an Article has been hard deleted.

When destroy repeats on the stale record.

Then StaleRecord returns and exactly one destroy event remains.

Owned by
`destroying a stale record returns an error and does not record a second destroy event`
in `test/ash_events/security_reports_test.exs`.
