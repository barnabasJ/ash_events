<!--
SPDX-FileCopyrightText: 2023 ash_events contributors <https://github.com/ash-project/ash_events/graphs/contributors>

SPDX-License-Identifier: MIT
-->

# US-AEMAGIC-06 — Reject a malformed magic-link token

As a developer, I need native AshAuthentication flows to remain compatible with
event recording and replay.

Given a malformed token passed to the real sign-in action.

When the native action validates the token.

Then it raises Forbidden and creates no user.

Owned by the case `sign in with invalid token format fails` in
`test/ash_events/ash_authentication_magic_link_test.exs`.
