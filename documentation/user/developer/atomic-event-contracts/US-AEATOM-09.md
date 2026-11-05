<!--
SPDX-FileCopyrightText: 2023 ash_events contributors <https://github.com/ash-project/ash_events/graphs/contributors>

SPDX-License-Identifier: MIT
-->

# US-AEATOM-09 — Return single-action event notifications through native Ash callbacks

As a developer, I need atomic recording to preserve the native event producer,
storage and replay contracts.

Given a real managed-relationship source create requests notifications.

When the normal single-action callback records its event.

Then exactly one returned source-event notification identifies the persisted
source record.

Owned by `test/ash_events/atomic_upstream_compatibility_test.exs`.
