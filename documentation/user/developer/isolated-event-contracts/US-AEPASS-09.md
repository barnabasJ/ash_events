<!-- SPDX-FileCopyrightText: 2026 ash_events contributors -->
<!-- SPDX-License-Identifier: MIT -->

# US-AEPASS-09: password change with mismatched new passwords fails

As a developer, I need the event contract to preserve source behavior and replay
correctness.

Given new password and confirmation differ.

When the native change-password action runs.

Then the change fails.

Owned by `password change with mismatched new passwords fails` in
`test/ash_events/ash_authentication_password_test.exs`.
