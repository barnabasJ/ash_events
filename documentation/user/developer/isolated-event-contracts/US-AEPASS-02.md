<!-- SPDX-FileCopyrightText: 2026 ash_events contributors -->
<!-- SPDX-License-Identifier: MIT -->

# US-AEPASS-02: registration with mismatched passwords fails gracefully

As a developer, I need the event contract to preserve source behavior and replay
correctness.

Given password confirmation differs.

When the native registration action runs.

Then registration returns validation errors.

Owned by `registration with mismatched passwords fails gracefully` in
`test/ash_events/ash_authentication_password_test.exs`.
