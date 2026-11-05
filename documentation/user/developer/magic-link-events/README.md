<!--
SPDX-FileCopyrightText: 2023 ash_events contributors <https://github.com/ash-project/ash_events/graphs/contributors>

SPDX-License-Identifier: MIT
-->

# Magic-link event integration stories

These cases use native Auth5 generic request actions, native token APIs, public
sign-in actions and persisted event replay. SQL Sandbox owns isolation and
rollback; the file uses `async: true`. The configured external sender performs
no real email delivery.

| Story                             | Behavior                                                      |
| --------------------------------- | ------------------------------------------------------------- |
| [US-AEMAGIC-01](US-AEMAGIC-01.md) | Request a magic link for a new identity                       |
| [US-AEMAGIC-02](US-AEMAGIC-02.md) | Request a magic link for an existing identity                 |
| [US-AEMAGIC-03](US-AEMAGIC-03.md) | Keep the request response opaque for malformed identity input |
| [US-AEMAGIC-04](US-AEMAGIC-04.md) | Register a new user and retain magic-link events              |
| [US-AEMAGIC-05](US-AEMAGIC-05.md) | Sign an existing user in without duplicating the user         |
| [US-AEMAGIC-06](US-AEMAGIC-06.md) | Reject a malformed magic-link token                           |
| [US-AEMAGIC-07](US-AEMAGIC-07.md) | Reject an actually expired native magic-link JWT              |
| [US-AEMAGIC-08](US-AEMAGIC-08.md) | Replay a native magic-link registration                       |
| [US-AEMAGIC-09](US-AEMAGIC-09.md) | Replay combined password and magic-link authentication        |
| [US-AEMAGIC-10](US-AEMAGIC-10.md) | Retain supported actor attribution for magic-link operations  |
| [US-AEMAGIC-11](US-AEMAGIC-11.md) | Use both password and magic-link authentication for one user  |
