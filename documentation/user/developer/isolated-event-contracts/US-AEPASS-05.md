<!-- SPDX-FileCopyrightText: 2026 ash_events contributors -->
<!-- SPDX-License-Identifier: MIT -->

# US-AEPASS-05: password reset request generates token

As a developer, I need the event contract to preserve source behavior and replay
correctness.

Given a registered email exists.

When the native reset request runs.

Then the native request returns :ok; token delivery is outside this case.

Owned by `password reset request generates token` in
`test/ash_events/ash_authentication_password_test.exs`.
