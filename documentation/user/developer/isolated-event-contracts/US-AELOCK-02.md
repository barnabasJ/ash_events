<!-- SPDX-FileCopyrightText: 2026 ash_events contributors -->
<!-- SPDX-License-Identifier: MIT -->

# US-AELOCK-02: advisory locks built tenant value is used for resources with multitenancy

As a developer, I need event delivery, timestamp selection and native locking to
preserve their contracts under isolated execution.

Given a tenant-scoped resource records several events.

When its current backend lock rows are read.

Then the native tenant key exists alongside the default key.

Owned by
`advisory locks built tenant value is used for resources with multitenancy` in
`test/ash_events/advisory_locks_test.exs`.
