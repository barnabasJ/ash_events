<!-- SPDX-FileCopyrightText: 2026 ash_events contributors -->
<!-- SPDX-License-Identifier: MIT -->

# US-AEFORM-01: manage_relationship changes are visible for nested form generation

As a developer, I need the event contract to preserve source behavior and replay
correctness.

Given a tracked action manages a relationship.

When its compiled changes are inspected.

Then ManageRelationship remains directly visible to nested-form generation.

Owned by `manage_relationship changes are visible for nested form generation` in
`test/ash_events/forms_test.exs`.
