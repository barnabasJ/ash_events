<!--
SPDX-FileCopyrightText: 2023 ash_events contributors <https://github.com/ash-project/ash_events/graphs/contributors>

SPDX-License-Identifier: MIT
-->

# US-AEHONE-02 — Restore a managed has-one child exactly once

As a developer, I need native event recording and replay to preserve source
state, relationships and stored data compatibility.

Given a real nested parent-child creation stream retains both original
identities.

When the native replay action rebuilds the stream while skipping original
lifecycle effects.

Then the parent has the original child identity and exactly one child row for
that parent.

Owned by the case
`replay does not duplicate child — child is recreated from its own event` in
`test/ash_events/manage_relationship/has_one_test.exs`.
