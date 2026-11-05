<!--
SPDX-FileCopyrightText: 2023 ash_events contributors <https://github.com/ash-project/ash_events/graphs/contributors>

SPDX-License-Identifier: MIT
-->

# US-AEBTO-02 — Restore a managed belongs-to foreign key from event state

As a developer, I need native event recording and replay to preserve source
state, relationships and stored data compatibility.

Given a real child role has a recorded user foreign key.

When the native replay action rebuilds its event stream.

Then the original role identity, role name and destination user identity
survive.

Owned by the case `replay correctly restores FK from changed_attributes` in
`test/ash_events/manage_relationship/belongs_to_test.exs`.
