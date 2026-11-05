<!--
SPDX-FileCopyrightText: 2023 ash_events contributors <https://github.com/ash-project/ash_events/graphs/contributors>

SPDX-License-Identifier: MIT
-->

# US-AEMAGIC-07 — Reject an actually expired native magic-link JWT

As a developer, I need native AshAuthentication flows to remain compatible with
event recording and replay.

Given a JWT minted by the native resource token API with the correct magic-link
purpose and a fixed past expiration.

When the real sign-in action validates that signed JWT.

Then it raises Forbidden and creates no user without waiting for elapsed time.

Owned by the case `sign in with expired token fails` in
`test/ash_events/ash_authentication_magic_link_test.exs`.
