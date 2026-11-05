<!-- SPDX-FileCopyrightText: 2026 ash_events contributors -->
<!-- SPDX-License-Identifier: MIT -->

# US-AEBIN-03: dump_value and cast_from_embedded round-trip binary values

As a developer, I need the event contract to preserve source behavior and replay
correctness.

Given a binary attribute has arbitrary bytes.

When native dump and embedded cast run.

Then the original bytes round-trip.

Owned by `dump_value and cast_from_embedded round-trip binary values` in
`test/ash_events/binary_attributes_test.exs`.
