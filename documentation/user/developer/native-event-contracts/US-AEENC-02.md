<!--
SPDX-FileCopyrightText: 2023 ash_events contributors <https://github.com/ash-project/ash_events/graphs/contributors>

SPDX-License-Identifier: MIT
-->

# US-AEENC-02 — Replay cloaked event calculations at selected boundaries

As a developer, I need native event recording and replay to preserve source
state, relationships and stored data compatibility.

Given a cloaked source is created and updated.

When the native reader loads payload calculations and replay stops at the create
event or consumes the full stream.

Then decrypted payload values are correct and source state matches the selected
replay boundary.

Owned by the case `cloaked event logs calcs and replay work` in
`test/ash_events/encryption_test.exs`.
