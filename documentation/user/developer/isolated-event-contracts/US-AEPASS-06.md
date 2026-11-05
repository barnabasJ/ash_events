<!-- SPDX-FileCopyrightText: 2026 ash_events contributors -->
<!-- SPDX-License-Identifier: MIT -->

# US-AEPASS-06: password reset request with non-existent email succeeds silently

As a developer, I need the event contract to preserve source behavior and replay
correctness.

Given an email is not registered.

When the native reset request runs.

Then the request succeeds without disclosing account existence.

Owned by `password reset request with non-existent email succeeds silently` in
`test/ash_events/ash_authentication_password_test.exs`.
