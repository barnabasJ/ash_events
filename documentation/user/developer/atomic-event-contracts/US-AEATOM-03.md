<!--
SPDX-FileCopyrightText: 2023 ash_events contributors <https://github.com/ash-project/ash_events/graphs/contributors>

SPDX-License-Identifier: MIT
-->

# US-AEATOM-03 — Preserve an explicit nil clear through persistence and replay

As a developer, I need atomic event recording to retain native action guarantees
and reconstructible persisted state.

Given an atomic resource has a non-nil nullable attribute.

When a real action clears it without accepting it as input.

Then the persisted event includes the explicit nil, and native replay restores
the cleared state without recording new events.

Owned by `test/ash_events/atomic_upstream_compatibility_test.exs`.
