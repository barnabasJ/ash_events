<!--
SPDX-FileCopyrightText: 2023 ash_events contributors <https://github.com/ash-project/ash_events/graphs/contributors>

SPDX-License-Identifier: MIT
-->

# US-AEATOM-08 — Use the actual update timestamp for update events

As a developer, I need atomic recording to preserve the native event producer,
storage and replay contracts.

Given a source record has deliberately distinct fixed creation and update
timestamps.

When its real required-atomic update stores the later configured update
timestamp.

Then the persisted update event uses that exact update timestamp without
sleeping or waiting.

Owned by `test/ash_events/atomic_upstream_compatibility_test.exs`.
