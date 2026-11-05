<!-- SPDX-FileCopyrightText: 2026 ash_events contributors -->
<!-- SPDX-License-Identifier: MIT -->

# US-AEFORM-04: handles ash phoenix forms correctly

As a developer, I need the event contract to preserve source behavior and replay
correctness.

Given a Phoenix form receives mixed supported and unsupported input keys.

When the form is submitted.

Then the tracked action succeeds.

Owned by `handles ash phoenix forms correctly` in
`test/ash_events/forms_test.exs`.
