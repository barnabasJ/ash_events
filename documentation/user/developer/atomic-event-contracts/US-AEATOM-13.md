<!--
SPDX-FileCopyrightText: 2023 ash_events contributors <https://github.com/ash-project/ash_events/graphs/contributors>

SPDX-License-Identifier: MIT
-->

# US-AEATOM-13 — Reject unsupported atomic upserts at the native DSL boundary

As a developer, I need atomic recording to preserve the native event producer,
storage and replay contracts.

Given a unique resource definition requests a tracked atomic upsert.

When the normal compiler applies the AshEvents transformer.

Then a contextual DSL error rejects that unsupported contract before any source
action can execute.

Owned by `test/ash_events/atomic_upstream_compatibility_test.exs`.
