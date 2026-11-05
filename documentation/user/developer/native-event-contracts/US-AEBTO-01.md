<!--
SPDX-FileCopyrightText: 2023 ash_events contributors <https://github.com/ash-project/ash_events/graphs/contributors>

SPDX-License-Identifier: MIT
-->

# US-AEBTO-01 — Retain the final managed belongs-to foreign key

As a developer, I need native event recording and replay to preserve source
state, relationships and stored data compatibility.

Given a real user exists and a child action accepts the relationship identity as
input.

When the action appends the relationship and records its event.

Then the child FK and persisted changed_attributes both identify that user.

Owned by the case
`action creates record with FK set, event captures FK in changed_attributes` in
`test/ash_events/manage_relationship/belongs_to_test.exs`.
