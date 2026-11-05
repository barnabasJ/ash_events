<!-- SPDX-FileCopyrightText: 2026 ash_events contributors -->
<!-- SPDX-License-Identifier: MIT -->

# US-AENOTIFY-03: single destroy still delivers the record's own notification

As a developer, I need event delivery, timestamp selection and native locking to
preserve their contracts under isolated execution.

Given an Article uses native manual hard destroy.

When destroy requests returned notifications.

Then the result retains the Article notification.

Owned by `single destroy still delivers the record's own notification` in
`test/ash_events/notifications_test.exs`.
