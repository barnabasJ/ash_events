<!--
SPDX-FileCopyrightText: 2023 ash_events contributors <https://github.com/ash-project/ash_events/graphs/contributors>

SPDX-License-Identifier: MIT
-->

# US-AECREATE-01 — Retain event order input metadata and actor attribution

As a developer, I need native event recording and replay to preserve source
state, relationships and stored data compatibility.

Given a public user action creates a user and its managed role with explicit
metadata.

When the persisted event log is read in event order.

Then the user event precedes the role event and both preserve the expected input
metadata and actor attribution.

Owned by the case `events are created as expected` in
`test/ash_events/event_creation_test.exs`.
