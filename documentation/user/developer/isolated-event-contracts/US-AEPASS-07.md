<!-- SPDX-FileCopyrightText: 2026 ash_events contributors -->
<!-- SPDX-License-Identifier: MIT -->

# US-AEPASS-07: user can change password with correct current password

As a developer, I need the event contract to preserve source behavior and replay
correctness.

Given a User supplies its current password.

When the native change-password action runs.

Then the new password works.

Owned by `user can change password with correct current password` in
`test/ash_events/ash_authentication_password_test.exs`.
