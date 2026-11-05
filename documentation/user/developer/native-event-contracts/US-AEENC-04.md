<!--
SPDX-FileCopyrightText: 2023 ash_events contributors <https://github.com/ash-project/ash_events/graphs/contributors>

SPDX-License-Identifier: MIT
-->

# US-AEENC-04 — Read historical base64 encrypted event rows

As a developer, I need native event recording and replay to preserve source
state, relationships and stored data compatibility.

Given a real event row is converted to the pre-0.8 stored ciphertext
representation.

When the native reader loads its decrypted payload calculations.

Then original input, metadata and recorded primary-key state remain readable.

Owned by the case
`events stored as base64 by releases before 0.8.0 still decrypt` in
`test/ash_events/encryption_test.exs`.
