<!-- SPDX-FileCopyrightText: 2026 ash_events contributors -->
<!-- SPDX-License-Identifier: MIT -->

# US-AEFORM-02: AshPhoenix nested forms work with manage_relationship on event-tracked resources

As a developer, I need the event contract to preserve source behavior and replay
correctness.

Given a tracked User form has a nested role.

When the form is submitted.

Then User and role exist with separate events.

Owned by
`AshPhoenix nested forms work with manage_relationship on event-tracked resources`
in `test/ash_events/forms_test.exs`.
