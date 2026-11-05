<!--
SPDX-FileCopyrightText: 2023 ash_events contributors <https://github.com/ash-project/ash_events/graphs/contributors>

SPDX-License-Identifier: MIT
-->

# US-AEHONE-01 — Record parent and managed has-one child separately

As a developer, I need native event recording and replay to preserve source
state, relationships and stored data compatibility.

Given a real user creation action receives nested role data.

When the action creates and loads its managed child.

Then the parent and child both exist and each has its own correctly named
creation event.

Owned by the case `creates parent and child, separate events for each` in
`test/ash_events/manage_relationship/has_one_test.exs`.
