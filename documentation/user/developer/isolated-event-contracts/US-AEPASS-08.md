<!-- SPDX-FileCopyrightText: 2026 ash_events contributors -->
<!-- SPDX-License-Identifier: MIT -->

# US-AEPASS-08: password change with incorrect current password fails

As a developer, I need the event contract to preserve source behavior and replay
correctness.

Given a User supplies an incorrect current password.

When the native change-password action runs.

Then the change fails.

Owned by `password change with incorrect current password fails` in
`test/ash_events/ash_authentication_password_test.exs`.
