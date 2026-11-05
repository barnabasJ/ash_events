<!--
SPDX-FileCopyrightText: 2023 ash_events contributors <https://github.com/ash-project/ash_events/graphs/contributors>

SPDX-License-Identifier: MIT
-->

# US-AEATOM-10 — Return atomic-batch event notifications through native Ash callbacks

As a developer, I need atomic recording to preserve the native event producer,
storage and replay contracts.

Given two source records use an update action that requires atomic execution.

When the native atomic bulk pipeline returns records and notifications.

Then each successful source update has exactly one returned persisted event
notification and the correct business state.

Owned by `test/ash_events/atomic_upstream_compatibility_test.exs`.
