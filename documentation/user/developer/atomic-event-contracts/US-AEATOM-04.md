<!--
SPDX-FileCopyrightText: 2023 ash_events contributors <https://github.com/ash-project/ash_events/graphs/contributors>

SPDX-License-Identifier: MIT
-->

# US-AEATOM-04 — Preserve a managed belongs-to foreign key through persistence and replay

As a developer, I need atomic event recording to retain native action guarantees
and reconstructible persisted state.

Given a real destination user and a source action with a same-named relationship
argument.

When manage_relationship sets the resulting foreign key and the recorder
persists the source event.

Then the event contains the final foreign key, and native replay restores it
without rerunning relationship side effects or adding events.

Owned by `test/ash_events/atomic_upstream_compatibility_test.exs`.
