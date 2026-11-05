<!-- SPDX-FileCopyrightText: 2026 ash_events contributors -->
<!-- SPDX-License-Identifier: MIT -->

# US-AENOTIFY-05: bulk create returns event log notifications alongside the resource's own

As a developer, I need event delivery, timestamp selection and native locking to
preserve their contracts under isolated execution.

Given bulk User create requests notifications.

When the native bulk action runs.

Then its returned list contains one EventLog notification.

Owned by
`bulk create returns event log notifications alongside the resource's own` in
`test/ash_events/notifications_test.exs`.
