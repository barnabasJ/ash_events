<!--
SPDX-FileCopyrightText: 2023 ash_events contributors <https://github.com/ash-project/ash_events/graphs/contributors>

SPDX-License-Identifier: MIT
-->

# US-AEMAGIC-05 — Sign an existing user in without duplicating the user

As a developer, I need native AshAuthentication flows to remain compatible with
event recording and replay.

Given a confirmed registered user and a native magic-link token.

When the real magic-link sign-in action runs.

Then it returns the existing user identity and a token while the user count
remains one.

Owned by the case `existing user can sign in via magic link` in
`test/ash_events/ash_authentication_magic_link_test.exs`.
