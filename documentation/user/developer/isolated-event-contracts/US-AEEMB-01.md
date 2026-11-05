<!-- SPDX-FileCopyrightText: 2026 ash_events contributors -->
<!-- SPDX-License-Identifier: MIT -->

# US-AEEMB-01: handles embedded resources

As a developer, I need the event contract to preserve source behavior and replay
correctness.

Given User input contains one embedded address and a list of addresses.

When create, update and native replay run.

Then address fields survive replay and partial update while the cleared list
stays empty.

Owned by `handles embedded resources` in
`test/ash_events/embedded_resources_test.exs`.
