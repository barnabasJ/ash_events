<!--
SPDX-FileCopyrightText: 2023 ash_events contributors <https://github.com/ash-project/ash_events/graphs/contributors>

SPDX-License-Identifier: MIT
-->

# US-AEM2M-02 — Restore managed many-to-many associations

As a developer, I need native event recording and replay to preserve source
state, relationships and stored data compatibility.

Given a real article has two managed tag associations.

When the native replay action rebuilds its event stream.

Then the original article identity has the same two associated tag names.

Owned by the case `replay restores article-tag associations` in
`test/ash_events/manage_relationship/many_to_many_test.exs`.
