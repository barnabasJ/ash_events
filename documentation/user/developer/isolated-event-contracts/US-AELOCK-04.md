<!-- SPDX-FileCopyrightText: 2026 ash_events contributors -->
<!-- SPDX-License-Identifier: MIT -->

# US-AELOCK-04: advisory lock generator raises on unsupported tenant type

As a developer, I need event delivery, timestamp selection and native locking to
preserve their contracts under isolated execution.

Given a tenant key generator receives unsupported string and atom tenants.

When the native generator runs.

Then it raises its contextual unsupported-tenant errors.

Owned by `advisory lock generator raises on unsupported tenant type` in
`test/ash_events/advisory_locks_test.exs`.
