<!-- SPDX-FileCopyrightText: 2026 ash_events contributors -->
<!-- SPDX-License-Identifier: MIT -->

# US-AECHG-06: AshPhoenix.Form with explicit auto-generated parameters

As a developer, I need the event contract to preserve source behavior and replay
correctness.

Given a form explicitly supplies status.

When the form creates User.

Then event data retains explicit status and changed_attributes retains the
generated slug.

Owned by `AshPhoenix.Form with explicit auto-generated parameters` in
`test/ash_events/changed_attributes_test.exs`.
