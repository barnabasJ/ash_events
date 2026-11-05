<!--
SPDX-FileCopyrightText: 2023 ash_events contributors <https://github.com/ash-project/ash_events/graphs/contributors>

SPDX-License-Identifier: MIT
-->

# US-AEENC-05 — Read legacy and current ciphertext formats together

As a developer, I need native event recording and replay to preserve source
state, relationships and stored data compatibility.

Given the event stream contains one real legacy-base64 row and one current
raw-ciphertext row.

When the native reader loads both payloads in event order.

Then both original inputs are decrypted correctly in the same read.

Owned by the case `legacy and current format events decrypt in the same read` in
`test/ash_events/encryption_test.exs`.
