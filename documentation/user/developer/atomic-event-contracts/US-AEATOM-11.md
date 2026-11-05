<!--
SPDX-FileCopyrightText: 2023 ash_events contributors <https://github.com/ash-project/ash_events/graphs/contributors>

SPDX-License-Identifier: MIT
-->

# US-AEATOM-11 — Preserve soft-destroy semantics during replay

As a developer, I need atomic recording to preserve the native event producer,
storage and replay contracts.

Given a real atomic-mode source records a fixed soft-deletion value.

When native replay consumes its creation and soft-destruction events.

Then the row remains present with the exact recorded soft-delete state and no
duplicate destruction event.

Owned by `test/ash_events/atomic_upstream_compatibility_test.exs`.
