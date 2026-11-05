<!-- SPDX-FileCopyrightText: 2026 ash_events contributors -->
<!-- SPDX-License-Identifier: MIT -->

# US-AELOCK-03: a failed advisory lock acquisition raises with its own error instead of a 25P02

As a developer, I need event delivery, timestamp selection and native locking to
preserve their contracts under isolated execution.

Given an ExUnit-supervised Postgrex connection holds one tenant key.

When the real tenant action reaches the native 200ms database lock deadline.

Then Ash raises Unknown containing the original 55P03 error and does not replace
it with 25P02.

Owned by
`a failed advisory lock acquisition raises with its own error instead of a 25P02`
in `test/ash_events/advisory_locks_test.exs`.
