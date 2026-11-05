<!--
SPDX-FileCopyrightText: 2023 ash_events contributors <https://github.com/ash-project/ash_events/graphs/contributors>

SPDX-License-Identifier: MIT
-->

# US-AEMAGIC-01 — Request a magic link for a new identity

As a developer, I need native AshAuthentication flows to remain compatible with
event recording and replay.

Given a new email identity and the native Auth5 request action.

When the caller builds ActionInput and runs the generic action.

Then the public request returns exactly :ok without disclosing whether a user
exists.

Owned by the case `requesting magic link for new email succeeds` in
`test/ash_events/ash_authentication_magic_link_test.exs`.
