<!--
SPDX-FileCopyrightText: 2023 ash_events contributors <https://github.com/ash-project/ash_events/graphs/contributors>

SPDX-License-Identifier: MIT
-->

# US-AEMAGIC-03 — Keep the request response opaque for malformed identity input

As a developer, I need native AshAuthentication flows to remain compatible with
event recording and replay.

Given a malformed email identity passed to the configured strategy.

When the generic magic-link request action runs.

Then the public response remains exactly :ok.

Owned by the case
`magic link request with invalid email format succeeds silently` in
`test/ash_events/ash_authentication_magic_link_test.exs`.
