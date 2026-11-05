<!-- SPDX-FileCopyrightText: 2026 ash_events contributors -->
<!-- SPDX-License-Identifier: MIT -->

# US-AEFORM-03: replay works correctly for events created via nested forms with manage_relationship

As a developer, I need the event contract to preserve source behavior and replay
correctness.

Given a tracked User action creates a managed role.

When native replay runs.

Then the original User and role IDs are restored without duplicates.

Owned by
`replay works correctly for events created via nested forms with manage_relationship`
in `test/ash_events/forms_test.exs`.
