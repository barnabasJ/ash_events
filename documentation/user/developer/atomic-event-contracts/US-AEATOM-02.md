<!--
SPDX-FileCopyrightText: 2023 ash_events contributors <https://github.com/ash-project/ash_events/graphs/contributors>

SPDX-License-Identifier: MIT
-->

# US-AEATOM-02 — Reject direct invocation of private replay companions

As a developer, I need atomic event recording to retain native action guarantees
and reconstructible persisted state.

Given a tracked record with generated create, update and destroy replay actions.

When callers invoke those actions through Ash without trusted replay context.

Then every action rejects the call, stays private, and leaves business and event
state unchanged.

Owned by `test/ash_events/atomic_upstream_compatibility_test.exs`.
