<!-- SPDX-FileCopyrightText: 2026 ash_events contributors -->
<!-- SPDX-License-Identifier: MIT -->

# US-AESEC-01: plain event log marks data, changed_attributes and metadata as sensitive

As a developer, I need the event contract to preserve source behavior and replay
correctness.

Given plain EventLog stores event payloads.

When compiled field metadata is inspected.

Then data, changed_attributes and metadata are sensitive.

Owned by
`plain event log marks data, changed_attributes and metadata as sensitive` in
`test/ash_events/security_reports_test.exs`.
