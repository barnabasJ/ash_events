<!-- SPDX-FileCopyrightText: 2026 ash_events contributors -->
<!-- SPDX-License-Identifier: MIT -->

# US-AEPASS-04: sign-in with incorrect password fails

As a developer, I need the event contract to preserve source behavior and replay
correctness.

Given a registered User exists.

When native sign-in receives an incorrect password.

Then authentication fails.

Owned by `sign-in with incorrect password fails` in
`test/ash_events/ash_authentication_password_test.exs`.
