<!--
SPDX-FileCopyrightText: 2023 ash_events contributors <https://github.com/ash-project/ash_events/graphs/contributors>

SPDX-License-Identifier: MIT
-->

# US-AEATOM-06 — Cast typed raw inputs before persisting and replaying them

As a developer, I need atomic recording to preserve the native event producer,
storage and replay contracts.

Given a real action accepts a raw date string and a raw boolean string.

When public creation stores a typed business result and the native shared
recorder writes its event.

Then the event contains correctly dumped typed values and native replay
reconstructs the same business state.

Owned by `test/ash_events/atomic_upstream_compatibility_test.exs`.
