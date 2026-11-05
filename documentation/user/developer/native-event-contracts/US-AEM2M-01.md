<!--
SPDX-FileCopyrightText: 2023 ash_events contributors <https://github.com/ash-project/ash_events/graphs/contributors>

SPDX-License-Identifier: MIT
-->

# US-AEM2M-01 — Record managed many-to-many join creation

As a developer, I need native event recording and replay to preserve source
state, relationships and stored data compatibility.

Given two existing tags are available to a real article action.

When the action appends both tags through manage_relationship.

Then the article has both relationships and exactly two join-resource events
exist.

Owned by the case
`creates article with existing tags, join table events created` in
`test/ash_events/manage_relationship/many_to_many_test.exs`.
