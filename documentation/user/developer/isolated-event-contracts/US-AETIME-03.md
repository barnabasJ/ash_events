<!-- SPDX-FileCopyrightText: 2026 ash_events contributors -->
<!-- SPDX-License-Identifier: MIT -->

# US-AETIME-03: org create action event occurred_at matches create_timestamp

As a developer, I need event delivery, timestamp selection and native locking to
preserve their contracts under isolated execution.

Given Org creation configures create_timestamp.

When the public create action runs.

Then its event occurred_at equals the created Org timestamp.

Owned by `org create action event occurred_at matches create_timestamp` in
`test/ash_events/timestamp_test.exs`.
