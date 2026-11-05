<!-- SPDX-FileCopyrightText: 2026 ash_events contributors -->
<!-- SPDX-License-Identifier: MIT -->

# US-AECHG-07: :as_arguments strategy during replay merges changed_attributes as action arguments

As a developer, I need the event contract to preserve source behavior and replay
correctness.

Given an update uses as_arguments replay strategy.

When the native event stream replays.

Then the final User name, slug and email are restored.

Owned by
`:as_arguments strategy during replay merges changed_attributes as action arguments`
in `test/ash_events/changed_attributes_test.exs`.
