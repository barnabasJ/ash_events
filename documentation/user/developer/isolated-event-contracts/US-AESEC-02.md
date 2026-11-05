<!-- SPDX-FileCopyrightText: 2026 ash_events contributors -->
<!-- SPDX-License-Identifier: MIT -->

# US-AESEC-02: cloaked event log exposes the decrypted payload as sensitive fields

As a developer, I need the event contract to preserve source behavior and replay
correctness.

Given cloaked EventLog exposes decrypted calculations.

When compiled field metadata is inspected.

Then all three decrypted payload fields are sensitive.

Owned by `cloaked event log exposes the decrypted payload as sensitive fields`
in `test/ash_events/security_reports_test.exs`.
