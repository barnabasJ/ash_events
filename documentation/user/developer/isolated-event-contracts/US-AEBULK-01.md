<!-- SPDX-FileCopyrightText: 2026 ash_events contributors -->
<!-- SPDX-License-Identifier: MIT -->

# US-AEBULK-01: bulk actions works as expected

As a developer, I need the event contract to preserve source behavior and replay
correctness.

Given two Users have tracked lifecycle actions.

When bulk create, update and destroy run.

Then record counts, event counts and returned notifications match each lifecycle
stage.

Owned by `bulk actions works as expected` in
`test/ash_events/bulk_actions_test.exs`.
