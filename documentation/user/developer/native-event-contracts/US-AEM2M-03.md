<!--
SPDX-FileCopyrightText: 2023 ash_events contributors <https://github.com/ash-project/ash_events/graphs/contributors>

SPDX-License-Identifier: MIT
-->

# US-AEM2M-03 — Replay managed many-to-many additions and removals

As a developer, I need native event recording and replay to preserve source
state, relationships and stored data compatibility.

Given a real article starts with two tag associations.

When its public update replaces one association and the native replay action
rebuilds the stream.

Then the final associations contain exactly the retained and newly added tags.

Owned by the case `adding and removing tags via update, replay works` in
`test/ash_events/manage_relationship/many_to_many_test.exs`.
