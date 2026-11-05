<!-- SPDX-FileCopyrightText: 2026 ash_events contributors -->
<!-- SPDX-License-Identifier: MIT -->

# US-AENOTIFY-01: create actions propagate event log notifications

As a developer, I need event delivery, timestamp selection and native locking to
preserve their contracts under isolated execution.

Given a User create emits an EventLog notification.

When native notifier dispatch completes.

Then the action caller receives its create EventLog notification.

Owned by `create actions propagate event log notifications` in
`test/ash_events/notifications_test.exs`.
