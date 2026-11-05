<!-- SPDX-FileCopyrightText: 2026 ash_events contributors -->
<!-- SPDX-License-Identifier: MIT -->

# US-AESEC-03: inspecting an event redacts the stored payload

As a developer, I need the event contract to preserve source behavior and replay
correctness.

Given an event contains a recognizable email.

When the event is inspected.

Then its payload remains accessible but inspect omits the email and payload
fields.

Owned by `inspecting an event redacts the stored payload` in
`test/ash_events/security_reports_test.exs`.
