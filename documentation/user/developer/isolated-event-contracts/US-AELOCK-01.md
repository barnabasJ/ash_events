<!-- SPDX-FileCopyrightText: 2026 ash_events contributors -->
<!-- SPDX-License-Identifier: MIT -->

# US-AELOCK-01: advisory lock default value is used for resources without multitenancy

As a developer, I need event delivery, timestamp selection and native locking to
preserve their contracts under isolated execution.

Given a resource has no multitenancy.

When its real create action records an event.

Then the current PostgreSQL backend holds the exact native default advisory key.

Owned by
`advisory lock default value is used for resources without multitenancy` in
`test/ash_events/advisory_locks_test.exs`.
