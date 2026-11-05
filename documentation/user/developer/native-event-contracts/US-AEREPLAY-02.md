<!--
SPDX-FileCopyrightText: 2023 ash_events contributors <https://github.com/ash-project/ash_events/graphs/contributors>

SPDX-License-Identifier: MIT
-->

# US-AEREPLAY-02 — Rebuild UUIDv7 event boundaries without duplicate lifecycle effects

As a developer, I need native event recording and replay to preserve source
state, relationships and stored data compatibility.

Given a UUIDv7-backed user has real create and update events.

When native replay selects the first update, creation time and complete stream.

Then the original identity resolves to the expected user fields at every
selected boundary.

Owned by the case
`replay works as expected and skips lifecycle hooks with uuidv7` in
`test/ash_events/replay_test.exs`.
