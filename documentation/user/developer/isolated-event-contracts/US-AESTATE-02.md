<!-- SPDX-FileCopyrightText: 2026 ash_events contributors -->
<!-- SPDX-License-Identifier: MIT -->

# US-AESTATE-02: default initial state should not be overridden when conditional state transition condition is not met

As a developer, I need the event contract to preserve source behavior and replay
correctness.

Given Upload has a conditional uploaded transition.

When creates omit and supply its required key.

Then the states are skipped and uploaded respectively.

Owned by
`default initial state should not be overridden when conditional state transition condition is not met`
in `test/ash_events/state_machine_test.exs`.
