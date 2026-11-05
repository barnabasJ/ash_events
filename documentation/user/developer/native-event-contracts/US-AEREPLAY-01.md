<!--
SPDX-FileCopyrightText: 2023 ash_events contributors <https://github.com/ash-project/ash_events/graphs/contributors>

SPDX-License-Identifier: MIT
-->

# US-AEREPLAY-01 — Rebuild selected event boundaries without duplicate lifecycle effects

As a developer, I need native event recording and replay to preserve source
state, relationships and stored data compatibility.

Given a user and managed role have real create and update events.

When native replay selects event-ID and timestamp boundaries and then the
complete stream.

Then user fields and the role match each boundary while child lifecycle effects
are not repeated.

Owned by the case `replay works as expected and skips lifecycle hooks` in
`test/ash_events/replay_test.exs`.
