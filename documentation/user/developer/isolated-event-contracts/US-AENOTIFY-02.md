<!-- SPDX-FileCopyrightText: 2026 ash_events contributors -->
<!-- SPDX-License-Identifier: MIT -->

# US-AENOTIFY-02: update actions propagate event log notifications

As a developer, I need event delivery, timestamp selection and native locking to
preserve their contracts under isolated execution.

Given a User update emits an EventLog notification.

When native notifier dispatch completes.

Then the action caller receives its update EventLog notification.

Owned by `update actions propagate event log notifications` in
`test/ash_events/notifications_test.exs`.
