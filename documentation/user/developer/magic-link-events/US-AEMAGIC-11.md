<!--
SPDX-FileCopyrightText: 2023 ash_events contributors <https://github.com/ash-project/ash_events/graphs/contributors>

SPDX-License-Identifier: MIT
-->

# US-AEMAGIC-11 — Use both password and magic-link authentication for one user

As a developer, I need native AshAuthentication flows to remain compatible with
event recording and replay.

Given a confirmed password registration.

When the same user signs in through password and native magic link.

Then both methods resolve the same single user and both source event families
remain recorded.

Owned by the case
`user can switch between password and magic link authentication` in
`test/ash_events/ash_authentication_magic_link_test.exs`.
