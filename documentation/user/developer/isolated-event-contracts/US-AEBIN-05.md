<!-- SPDX-FileCopyrightText: 2026 ash_events contributors -->
<!-- SPDX-License-Identifier: MIT -->

# US-AEBIN-05: cast_from_embedded passes through non-binary attribute types unchanged

As a developer, I need the event contract to preserve source behavior and replay
correctness.

Given an embedded attribute has string type.

When native embedded cast runs.

Then the original string is preserved.

Owned by
`cast_from_embedded passes through non-binary attribute types unchanged` in
`test/ash_events/binary_attributes_test.exs`.
