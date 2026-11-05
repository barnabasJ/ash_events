<!--
SPDX-FileCopyrightText: 2023 ash_events contributors <https://github.com/ash-project/ash_events/graphs/contributors>

SPDX-License-Identifier: MIT
-->

# US-AEATOM-14 — Exclude unchanged unrelated sensitive values from update events

As a developer, I need atomic recording to preserve the native event producer,
storage and replay contracts.

Given a real cloaked record has a selected sensitive value.

When an unrelated fixed timestamp update creates another event.

Then its decrypted payload omits the unchanged plaintext and encrypted sensitive
fields.

Owned by `test/ash_events/atomic_upstream_compatibility_test.exs`.
