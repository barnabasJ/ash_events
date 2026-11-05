<!-- SPDX-FileCopyrightText: 2026 ash_events contributors -->
<!-- SPDX-License-Identifier: MIT -->

# US-AEHMANY-02: replay does not duplicate children

As a developer, I need the event contract to preserve source behavior and replay
correctness.

Given User has two managed Comments.

When native replay runs.

Then both original Comment IDs are restored without duplicates.

Owned by `replay does not duplicate children` in
`test/ash_events/manage_relationship/has_many_test.exs`.
