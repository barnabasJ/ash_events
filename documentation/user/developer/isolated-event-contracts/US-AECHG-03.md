<!-- SPDX-FileCopyrightText: 2026 ash_events contributors -->
<!-- SPDX-License-Identifier: MIT -->

# US-AECHG-03: changed_attributes are tracked with AshPhoenix.Form and string keys

As a developer, I need the event contract to preserve source behavior and replay
correctness.

Given a Phoenix form submits string-keyed input.

When the form creates User and native replay runs.

Then event payloads and restored generated fields retain their values.

Owned by `changed_attributes are tracked with AshPhoenix.Form and string keys`
in `test/ash_events/changed_attributes_test.exs`.
