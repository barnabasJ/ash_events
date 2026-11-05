<!-- SPDX-FileCopyrightText: 2026 ash_events contributors -->
<!-- SPDX-License-Identifier: MIT -->

# US-AESEC-05: soft destroying a stale record returns an error and does not record an event

As a developer, I need the event contract to preserve source behavior and replay
correctness.

Given an Article has been hard deleted.

When soft destroy runs on the stale record.

Then StaleRecord returns and no soft-destroy event appears.

Owned by
`soft destroying a stale record returns an error and does not record an event`
in `test/ash_events/security_reports_test.exs`.
