<!-- SPDX-FileCopyrightText: 2026 ash_events contributors -->
<!-- SPDX-License-Identifier: MIT -->

# US-AECHG-02: changed_attributes are applied during replay with force_change mode

As a developer, I need the event contract to preserve source behavior and replay
correctness.

Given a User event records generated fields.

When force-change replay runs.

Then the original ID, names, status and slug are restored.

Owned by `changed_attributes are applied during replay with force_change mode`
in `test/ash_events/changed_attributes_test.exs`.
