<!--
SPDX-FileCopyrightText: 2023 ash_events contributors <https://github.com/ash-project/ash_events/graphs/contributors>

SPDX-License-Identifier: MIT
-->

# US-AEATOM-01 — Keep normal tracked updates atomic and attributed

As a developer, I need atomic event recording to retain native action guarantees
and reconstructible persisted state.

Given a resource with atomic event recording and a required atomic update.

When its real create and update actions execute.

Then business state and exactly one attributed event per successful action are
persisted.

Owned by `test/ash_events/atomic_upstream_compatibility_test.exs`.
