<!-- SPDX-FileCopyrightText: 2026 ash_events contributors -->
<!-- SPDX-License-Identifier: MIT -->

# US-AETIME-06: upsert action that updates existing record uses update_timestamp for occurred_at

As a developer, I need event delivery, timestamp selection and native locking to
preserve their contracts under isolated execution.

Given a User has fixed equal creation and update timestamps.

When a second upsert supplies a fixed later update timestamp.

Then the same User ID remains and its final event uses the later update
timestamp without a sleep.

Owned by
`upsert action that updates existing record uses update_timestamp for occurred_at`
in `test/ash_events/timestamp_test.exs`.
