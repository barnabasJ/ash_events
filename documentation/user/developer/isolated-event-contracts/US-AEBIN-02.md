<!-- SPDX-FileCopyrightText: 2026 ash_events contributors -->
<!-- SPDX-License-Identifier: MIT -->

# US-AEBIN-02: binary attribute is stored in event data as base64

As a developer, I need the event contract to preserve source behavior and replay
correctness.

Given Org input contains a binary secret_hash.

When the persisted event is read.

Then the JSON payload contains its base64 encoding.

Owned by `binary attribute is stored in event data as base64` in
`test/ash_events/binary_attributes_test.exs`.
