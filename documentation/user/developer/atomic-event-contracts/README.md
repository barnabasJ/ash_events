<!--
SPDX-FileCopyrightText: 2023 ash_events contributors <https://github.com/ash-project/ash_events/graphs/contributors>

SPDX-License-Identifier: MIT
-->

# Atomic event recording stories

These cases use real public Ash actions, persisted event reads and the native
replay action. They use the existing SQL Sandbox with `async: true`.

| Story                           | Behavior                                                                 |
| ------------------------------- | ------------------------------------------------------------------------ |
| [US-AEATOM-01](US-AEATOM-01.md) | Keep normal tracked updates atomic and attributed                        |
| [US-AEATOM-02](US-AEATOM-02.md) | Reject direct invocation of private replay companions                    |
| [US-AEATOM-03](US-AEATOM-03.md) | Preserve an explicit nil clear through persistence and replay            |
| [US-AEATOM-04](US-AEATOM-04.md) | Preserve a managed belongs-to foreign key through persistence and replay |
| [US-AEATOM-05](US-AEATOM-05.md) | Record no event for a failed stale destroy                               |
| [US-AEATOM-06](US-AEATOM-06.md) | Cast typed raw inputs before persisting and replaying them               |
| [US-AEATOM-07](US-AEATOM-07.md) | Preserve cloaked sensitive input without plaintext storage               |
| [US-AEATOM-08](US-AEATOM-08.md) | Use the actual update timestamp for update events                        |
| [US-AEATOM-09](US-AEATOM-09.md) | Return single-action event notifications through native Ash callbacks    |
| [US-AEATOM-10](US-AEATOM-10.md) | Return atomic-batch event notifications through native Ash callbacks     |
| [US-AEATOM-11](US-AEATOM-11.md) | Preserve soft-destroy semantics during replay                            |
| [US-AEATOM-12](US-AEATOM-12.md) | Fail contextually when a stored atomic event has no companion            |
| [US-AEATOM-13](US-AEATOM-13.md) | Reject unsupported atomic upserts at the native DSL boundary             |
| [US-AEATOM-14](US-AEATOM-14.md) | Exclude unchanged unrelated sensitive values from update events          |
