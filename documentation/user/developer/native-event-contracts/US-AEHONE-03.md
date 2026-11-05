<!--
SPDX-FileCopyrightText: 2023 ash_events contributors <https://github.com/ash-project/ash_events/graphs/contributors>

SPDX-License-Identifier: MIT
-->

# US-AEHONE-03 — Restore a child created through a managed has-one create action

As a developer, I need native event recording and replay to preserve source
state, relationships and stored data compatibility.

Given a real parent action creates a viewer role through manage_relationship.

When the native replay action rebuilds both resources.

Then the original child identity and viewer role remain attached to the parent.

Owned by the case `creates parent and child, replay works correctly` in
`test/ash_events/manage_relationship/has_one_test.exs`.
