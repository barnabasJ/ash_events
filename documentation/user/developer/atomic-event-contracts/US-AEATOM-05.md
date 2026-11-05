<!--
SPDX-FileCopyrightText: 2023 ash_events contributors <https://github.com/ash-project/ash_events/graphs/contributors>

SPDX-License-Identifier: MIT
-->

# US-AEATOM-05 — Record no event for a failed stale destroy

As a developer, I need atomic event recording to retain native action guarantees
and reconstructible persisted state.

Given a real atomic tracked record has been successfully destroyed.

When the original stale record is destroyed again through the normal Ash API.

Then the second destroy fails and only the successful destroy has a persisted
attributed event.

Owned by `test/ash_events/atomic_upstream_compatibility_test.exs`.
