<!--
SPDX-FileCopyrightText: 2023 ash_events contributors <https://github.com/ash-project/ash_events/graphs/contributors>

SPDX-License-Identifier: MIT
-->

# Native event integration stories

These cases use existing public source actions, native event readers and replay.
The existing SQL Sandbox owns each asynchronous case. Historical ciphertext
compatibility cases rewrite only their own real event rows.

| Story                               | Behavior                                                              |
| ----------------------------------- | --------------------------------------------------------------------- |
| [US-AEENC-01](US-AEENC-01.md)       | Encrypt event data and metadata                                       |
| [US-AEENC-02](US-AEENC-02.md)       | Replay cloaked event calculations at selected boundaries              |
| [US-AEENC-03](US-AEENC-03.md)       | Store new encrypted event rows as raw Cloak ciphertext                |
| [US-AEENC-04](US-AEENC-04.md)       | Read historical base64 encrypted event rows                           |
| [US-AEENC-05](US-AEENC-05.md)       | Read legacy and current ciphertext formats together                   |
| [US-AEENC-06](US-AEENC-06.md)       | Replay historical encrypted event rows                                |
| [US-AEM2M-01](US-AEM2M-01.md)       | Record managed many-to-many join creation                             |
| [US-AEM2M-02](US-AEM2M-02.md)       | Restore managed many-to-many associations                             |
| [US-AEM2M-03](US-AEM2M-03.md)       | Replay managed many-to-many additions and removals                    |
| [US-AEHONE-01](US-AEHONE-01.md)     | Record parent and managed has-one child separately                    |
| [US-AEHONE-02](US-AEHONE-02.md)     | Restore a managed has-one child exactly once                          |
| [US-AEHONE-03](US-AEHONE-03.md)     | Restore a child created through a managed has-one create action       |
| [US-AEBTO-01](US-AEBTO-01.md)       | Retain the final managed belongs-to foreign key                       |
| [US-AEBTO-02](US-AEBTO-02.md)       | Restore a managed belongs-to foreign key from event state             |
| [US-AEBTO-03](US-AEBTO-03.md)       | Restore a managed comment foreign key and body                        |
| [US-AEREPLAY-01](US-AEREPLAY-01.md) | Rebuild selected event boundaries without duplicate lifecycle effects |
| [US-AEREPLAY-02](US-AEREPLAY-02.md) | Rebuild UUIDv7 event boundaries without duplicate lifecycle effects   |
| [US-AECREATE-01](US-AECREATE-01.md) | Retain event order input metadata and actor attribution               |
| [US-AECREATE-02](US-AECREATE-02.md) | Keep native create update and destroy action composition              |
