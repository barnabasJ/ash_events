<!--
SPDX-FileCopyrightText: 2023 ash_events contributors <https://github.com/ash-project/ash_events/graphs/contributors>

SPDX-License-Identifier: MIT
-->

# US-AEATOM-07 — Preserve cloaked sensitive input without plaintext storage

As a developer, I need atomic recording to preserve the native event producer,
storage and replay contracts.

Given a real cloaked source accepts sensitive input and then changes it.

When the native recorder encrypts its event and native replay consumes the
stored payload.

Then decrypted input retains the original secret, normal changeset inspection
and event metadata do not expose the transient capture, raw stored ciphertext
and event inspection contain no plaintext, and replay restores the final
sensitive value.

Owned by `test/ash_events/atomic_upstream_compatibility_test.exs`.
