<!--
SPDX-FileCopyrightText: 2023 ash_events contributors <https://github.com/ash-project/ash_events/graphs/contributors>

SPDX-License-Identifier: MIT
-->

# US-AEMAGIC-08 — Replay a native magic-link registration

As a developer, I need native AshAuthentication flows to remain compatible with
event recording and replay.

Given a user registered through the real magic-link sign-in action.

When the native event-log replay action runs.

Then the original user ID and email are restored.

Owned by the case `magic link authentication events can be replayed correctly`
in `test/ash_events/ash_authentication_magic_link_test.exs`.
