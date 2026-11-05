<!--
SPDX-FileCopyrightText: 2023 ash_events contributors <https://github.com/ash-project/ash_events/graphs/contributors>

SPDX-License-Identifier: MIT
-->

# US-AEMAGIC-10 — Retain supported actor attribution for magic-link operations

As a developer, I need native AshAuthentication flows to remain compatible with
event recording and replay.

Given the upstream supported actor requests and uses a native magic link.

When the generic request and real sign-in actions execute.

Then the stored sign-in event retains that actor and does not invent a user
actor.

Owned by the case
`magic link operations with system actors are properly attributed in events` in
`test/ash_events/ash_authentication_magic_link_test.exs`.
