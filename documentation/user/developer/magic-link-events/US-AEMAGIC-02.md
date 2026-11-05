<!--
SPDX-FileCopyrightText: 2023 ash_events contributors <https://github.com/ash-project/ash_events/graphs/contributors>

SPDX-License-Identifier: MIT
-->

# US-AEMAGIC-02 — Request a magic link for an existing identity

As a developer, I need native AshAuthentication flows to remain compatible with
event recording and replay.

Given a user registered through the real password action.

When the caller requests a magic link through the native generic action.

Then the request returns exactly :ok for that existing identity.

Owned by the case `requesting magic link for existing user email succeeds` in
`test/ash_events/ash_authentication_magic_link_test.exs`.
