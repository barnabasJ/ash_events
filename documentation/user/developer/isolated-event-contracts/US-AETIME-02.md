<!-- SPDX-FileCopyrightText: 2026 ash_events contributors -->
<!-- SPDX-License-Identifier: MIT -->

# US-AETIME-02: update action event occurred_at matches update_timestamp

As a developer, I need event delivery, timestamp selection and native locking to
preserve their contracts under isolated execution.

Given User update configures update_timestamp.

When the public update action runs.

Then its event occurred_at equals the updated User timestamp.

Owned by `update action event occurred_at matches update_timestamp` in
`test/ash_events/timestamp_test.exs`.
