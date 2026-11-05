<!--
SPDX-FileCopyrightText: 2023 ash_events contributors <https://github.com/ash-project/ash_events/graphs/contributors>

SPDX-License-Identifier: MIT
-->

# US-AEBTO-03 — Restore a managed comment foreign key and body

As a developer, I need native event recording and replay to preserve source
state, relationships and stored data compatibility.

Given a real comment action appends its user relationship.

When the resulting event is read and the native replay action rebuilds the
stream.

Then the event contains the FK and the restored comment retains both user
identity and body.

Owned by the case `action creates comment with FK, replay restores it` in
`test/ash_events/manage_relationship/belongs_to_test.exs`.
