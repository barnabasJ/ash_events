<!-- SPDX-FileCopyrightText: 2026 ash_events contributors -->
<!-- SPDX-License-Identifier: MIT -->

# US-AEBIN-04: cast_from_embedded passes through nil

As a developer, I need the event contract to preserve source behavior and replay
correctness.

Given a binary embedded attribute is nil.

When native embedded cast runs.

Then nil is preserved.

Owned by `cast_from_embedded passes through nil` in
`test/ash_events/binary_attributes_test.exs`.
