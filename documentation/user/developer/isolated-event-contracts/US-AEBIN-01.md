<!-- SPDX-FileCopyrightText: 2026 ash_events contributors -->
<!-- SPDX-License-Identifier: MIT -->

# US-AEBIN-01: creating a resource with a binary attribute does not raise Jason.EncodeError

As a developer, I need the event contract to preserve source behavior and replay
correctness.

Given Org input contains arbitrary binary bytes.

When the public create action runs.

Then the source binary is retained without a JSON encoding error.

Owned by
`creating a resource with a binary attribute does not raise Jason.EncodeError`
in `test/ash_events/binary_attributes_test.exs`.
