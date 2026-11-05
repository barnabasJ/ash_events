<!-- SPDX-FileCopyrightText: 2026 ash_events contributors -->
<!-- SPDX-License-Identifier: MIT -->

# US-AETIME-05: upsert action that creates new record uses create_timestamp for occurred_at

As a developer, I need event delivery, timestamp selection and native locking to
preserve their contracts under isolated execution.

Given a User email does not exist.

When the public upsert action inserts it.

Then its event occurred_at equals create_timestamp.

Owned by
`upsert action that creates new record uses create_timestamp for occurred_at` in
`test/ash_events/timestamp_test.exs`.
