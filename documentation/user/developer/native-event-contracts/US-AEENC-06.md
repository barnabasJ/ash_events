<!--
SPDX-FileCopyrightText: 2023 ash_events contributors <https://github.com/ash-project/ash_events/graphs/contributors>

SPDX-License-Identifier: MIT
-->

# US-AEENC-06 — Replay historical encrypted event rows

As a developer, I need native event recording and replay to preserve source
state, relationships and stored data compatibility.

Given a real cloaked create and update stream is stored in the historical base64
representation.

When the native replay action reconstructs its source.

Then the final decrypted source value matches the recorded update.

Owned by the case `replay rebuilds state from legacy format events` in
`test/ash_events/encryption_test.exs`.
