<!-- SPDX-FileCopyrightText: 2026 ash_events contributors -->
<!-- SPDX-License-Identifier: MIT -->

# US-AESTATE-01: handles ash_state_machine validations

As a developer, I need the event contract to preserve source behavior and replay
correctness.

Given Org has a tracked state transition.

When the transition and native replay run.

Then state-machine validations accept the retained event stream.

Owned by `handles ash_state_machine validations` in
`test/ash_events/state_machine_test.exs`.
