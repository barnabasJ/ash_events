<!--
SPDX-FileCopyrightText: 2023 ash_events contributors <https://github.com/ash-project/ash_events/graphs/contributors>

SPDX-License-Identifier: MIT
-->

# US-AEMAGIC-04 — Register a new user and retain magic-link events

As a developer, I need native AshAuthentication flows to remain compatible with
event recording and replay.

Given a token minted by the native magic-link strategy for a new identity.

When the real sign-in action registers the user.

Then the user and authentication token exist and the attributed source event
retains expected replay data.

Owned by the case `new user can register via magic link and events are created`
in `test/ash_events/ash_authentication_magic_link_test.exs`.
