<!--
SPDX-FileCopyrightText: 2023 ash_events contributors <https://github.com/ash-project/ash_events/graphs/contributors>

SPDX-License-Identifier: MIT
-->

# US-AEENC-01 — Encrypt event data and metadata

As a developer, I need native event recording and replay to preserve source
state, relationships and stored data compatibility.

Given a cloaked source action has input and explicit event metadata.

When the public action creates a persisted cloaked event.

Then decrypting its stored ciphertext yields the original input and metadata.

Owned by the case `cloaked event logs encrypt data and metadata` in
`test/ash_events/encryption_test.exs`.
