<!--
SPDX-FileCopyrightText: 2023 ash_events contributors <https://github.com/ash-project/ash_events/graphs/contributors>

SPDX-License-Identifier: MIT
-->

# US-AEATOM-12 — Fail contextually when a stored atomic event has no companion

As a developer, I need atomic recording to preserve the native event producer,
storage and replay contracts.

Given a historical event refers to an action that still exists but is no longer
tracked.

When the public replay action cannot find the required private companion.

Then it identifies the incompatible stored event and requires an explicit
override instead of running live business changes.

Owned by `test/ash_events/atomic_upstream_compatibility_test.exs`.
