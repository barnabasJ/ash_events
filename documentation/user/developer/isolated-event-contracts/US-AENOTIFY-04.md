<!-- SPDX-FileCopyrightText: 2026 ash_events contributors -->
<!-- SPDX-License-Identifier: MIT -->

# US-AENOTIFY-04: soft destroy actions propagate event log notifications

As a developer, I need event delivery, timestamp selection and native locking to
preserve their contracts under isolated execution.

Given an Article uses soft destroy.

When native notifier dispatch completes.

Then the caller receives the soft-destroy EventLog notification.

Owned by `soft destroy actions propagate event log notifications` in
`test/ash_events/notifications_test.exs`.
