<!-- SPDX-FileCopyrightText: 2026 ash_events contributors -->
<!-- SPDX-License-Identifier: MIT -->

# US-AEVAL-08: validations receive a Validation.Context on tracked actions

As a developer, I need the event contract to preserve source behavior and replay
correctness.

Given a tracked update requires a changed name.

When unchanged and changed names are submitted.

Then the first returns InvalidAttribute and the second succeeds.

Owned by `validations receive a Validation.Context on tracked actions` in
`test/ash_events/validation_test.exs`.
