<!--
SPDX-FileCopyrightText: 2023 ash_events contributors <https://github.com/ash-project/ash_events/graphs/contributors>

SPDX-License-Identifier: MIT
-->

# US-AEMAGIC-09 — Replay combined password and magic-link authentication

As a developer, I need native AshAuthentication flows to remain compatible with
event recording and replay.

Given a confirmed password user who also signs in with a native magic-link
token.

When the native event-log replay action rebuilds state.

Then identity and confirmation state survive and the password still
authenticates.

Owned by the case `magic link events for existing users replay correctly` in
`test/ash_events/ash_authentication_magic_link_test.exs`.
