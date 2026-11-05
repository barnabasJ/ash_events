<!--
SPDX-FileCopyrightText: 2023 ash_events contributors <https://github.com/ash-project/ash_events/graphs/contributors>

SPDX-License-Identifier: MIT
-->

# US-AEENC-03 — Store new encrypted event rows as raw Cloak ciphertext

As a developer, I need native event recording and replay to preserve source
state, relationships and stored data compatibility.

Given a new cloaked source event is created.

When the native event-log row is read.

Then each encrypted payload column starts with the raw Cloak tag byte.

Owned by the case `new events store raw Cloak ciphertext, not base64` in
`test/ash_events/encryption_test.exs`.
