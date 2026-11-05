<!-- SPDX-FileCopyrightText: 2026 ash_events contributors -->
<!-- SPDX-License-Identifier: MIT -->

# US-AEVAL-09: validations that read context.message use the custom message on tracked actions

As a developer, I need the event contract to preserve source behavior and replay
correctness.

Given a tracked changing validation defines a message.

When an update omits a changed name.

Then InvalidAttribute retains the configured message.

Owned by
`validations that read context.message use the custom message on tracked actions`
in `test/ash_events/validation_test.exs`.
