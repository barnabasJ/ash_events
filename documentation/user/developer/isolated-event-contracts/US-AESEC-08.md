<!-- SPDX-FileCopyrightText: 2026 ash_events contributors -->
<!-- SPDX-License-Identifier: MIT -->

# US-AESEC-08: the generated action exists and is documented as replay-only

As a developer, I need the event contract to preserve source behavior and replay
correctness.

Given User has an upsert replay companion.

When its compiled action metadata is inspected.

Then the companion is private and documents replay-only use.

Owned by `the generated action exists and is documented as replay-only` in
`test/ash_events/security_reports_test.exs`.
