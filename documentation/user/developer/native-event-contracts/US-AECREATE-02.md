<!--
SPDX-FileCopyrightText: 2023 ash_events contributors <https://github.com/ash-project/ash_events/graphs/contributors>

SPDX-License-Identifier: MIT
-->

# US-AECREATE-02 — Keep native create update and destroy action composition

As a developer, I need native event recording and replay to preserve source
state, relationships and stored data compatibility.

Given a real user and role are created through normal Ash changesets.

When the user is updated and both role and user are destroyed through their
public actions.

Then business rows are gone and the expected three-then-five event counts retain
all successful mutations.

Owned by the case `can be used just like normal actions/changesets` in
`test/ash_events/event_creation_test.exs`.
