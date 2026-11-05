<!-- SPDX-FileCopyrightText: 2026 ash_events contributors -->
<!-- SPDX-License-Identifier: MIT -->

# Isolated native event contracts

Each case uses the existing native RepoCase SQL Sandbox connection. Replay and
real source actions retain their original assertions.

| Story                               | Behavior                                                                                              |
| ----------------------------------- | ----------------------------------------------------------------------------------------------------- |
| [US-AEVAL-01](US-AEVAL-01.md)       | atomic changes throws error                                                                           |
| [US-AEVAL-02](US-AEVAL-02.md)       | replay events on event log missing clear function throws RuntimeError                                 |
| [US-AEVAL-03](US-AEVAL-03.md)       | only_actions works as expected                                                                        |
| [US-AEVAL-04](US-AEVAL-04.md)       | handles validation modules in wrapper gracefully                                                      |
| [US-AEVAL-05](US-AEVAL-05.md)       | replay events handles routed actions correctly                                                        |
| [US-AEVAL-06](US-AEVAL-06.md)       | before_action?: true delays a validation on a tracked action                                          |
| [US-AEVAL-07](US-AEVAL-07.md)       | before_action?: true behaves the same on tracked and ignored actions                                  |
| [US-AEVAL-08](US-AEVAL-08.md)       | validations receive a Validation.Context on tracked actions                                           |
| [US-AEVAL-09](US-AEVAL-09.md)       | validations that read context.message use the custom message on tracked actions                       |
| [US-AEVAL-10](US-AEVAL-10.md)       | custom validation messages are preserved when using AshEvents                                         |
| [US-AESEC-01](US-AESEC-01.md)       | plain event log marks data, changed_attributes and metadata as sensitive                              |
| [US-AESEC-02](US-AESEC-02.md)       | cloaked event log exposes the decrypted payload as sensitive fields                                   |
| [US-AESEC-03](US-AESEC-03.md)       | inspecting an event redacts the stored payload                                                        |
| [US-AESEC-04](US-AESEC-04.md)       | destroying a stale record returns an error and does not record a second destroy event                 |
| [US-AESEC-05](US-AESEC-05.md)       | soft destroying a stale record returns an error and does not record an event                          |
| [US-AESEC-06](US-AESEC-06.md)       | bulk destroying a stale record reports the error and does not record a second event                   |
| [US-AESEC-07](US-AESEC-07.md)       | bulk soft destroying a stale record reports the error and does not record an event                    |
| [US-AESEC-08](US-AESEC-08.md)       | the generated action exists and is documented as replay-only                                          |
| [US-AESEC-09](US-AESEC-09.md)       | calling the generated action outside replay fails and writes no event                                 |
| [US-AESEC-10](US-AESEC-10.md)       | calling the generated action via bulk_update with strategy atomic fails and writes no event           |
| [US-AESEC-11](US-AESEC-11.md)       | calling the generated action via bulk_update with strategy stream fails and writes no event           |
| [US-AESEC-12](US-AESEC-12.md)       | the generated action still runs when invoked with the replay marker                                   |
| [US-AEMAP-01](US-AEMAP-01.md)       | map arguments are correctly stored in event data                                                      |
| [US-AEMAP-02](US-AEMAP-02.md)       | nil map arguments are handled correctly                                                               |
| [US-AECHG-01](US-AECHG-01.md)       | changed_attributes are stored in events                                                               |
| [US-AECHG-02](US-AECHG-02.md)       | changed_attributes are applied during replay with force_change mode                                   |
| [US-AECHG-03](US-AECHG-03.md)       | changed_attributes are tracked with AshPhoenix.Form and string keys                                   |
| [US-AECHG-04](US-AECHG-04.md)       | changed_attributes are captured during updates                                                        |
| [US-AECHG-05](US-AECHG-05.md)       | attributes present in original params are not duplicated in changed_attributes                        |
| [US-AECHG-06](US-AECHG-06.md)       | AshPhoenix.Form with explicit auto-generated parameters                                               |
| [US-AECHG-07](US-AECHG-07.md)       | :as_arguments strategy during replay merges changed_attributes as action arguments                    |
| [US-AECHG-08](US-AECHG-08.md)       | as_arguments strategy vs force_change strategy behavior difference                                    |
| [US-AECHG-09](US-AECHG-09.md)       | as_arguments strategy passes changed_attributes as required arguments during replay                   |
| [US-AECHG-10](US-AECHG-10.md)       | as_arguments strategy would fail if required argument is not provided during replay                   |
| [US-AEDEST-01](US-AEDEST-01.md)     | creates an event when article is hard deleted                                                         |
| [US-AEDEST-02](US-AEDEST-02.md)     | hard delete removes the record from the database                                                      |
| [US-AEDEST-03](US-AEDEST-03.md)     | hard delete event stores the correct record_id                                                        |
| [US-AEDEST-04](US-AEDEST-04.md)     | events are created in order: create, update, destroy                                                  |
| [US-AEDEST-05](US-AEDEST-05.md)     | metadata is stored in hard delete events                                                              |
| [US-AEDEST-06](US-AEDEST-06.md)     | creates an event when article is soft deleted                                                         |
| [US-AEDEST-07](US-AEDEST-07.md)     | soft delete sets deleted_at on the record                                                             |
| [US-AEDEST-08](US-AEDEST-08.md)     | soft deleted record still exists in database                                                          |
| [US-AEDEST-09](US-AEDEST-09.md)     | metadata is stored in soft delete events                                                              |
| [US-AEDEST-10](US-AEDEST-10.md)     | creates an event when article is archived                                                             |
| [US-AEDEST-11](US-AEDEST-11.md)     | archive sets archived_at on the record                                                                |
| [US-AEDEST-12](US-AEDEST-12.md)     | unarchive clears archived_at                                                                          |
| [US-AEDEST-13](US-AEDEST-13.md)     | unarchive creates an event                                                                            |
| [US-AEDEST-14](US-AEDEST-14.md)     | replays hard delete events correctly                                                                  |
| [US-AEDEST-15](US-AEDEST-15.md)     | replays soft delete events correctly                                                                  |
| [US-AEDEST-16](US-AEDEST-16.md)     | replays archive/unarchive cycle correctly                                                             |
| [US-AEDEST-17](US-AEDEST-17.md)     | replays multiple articles with mixed delete types                                                     |
| [US-AEDEST-18](US-AEDEST-18.md)     | no duplicate events created during hard delete replay                                                 |
| [US-AEDEST-19](US-AEDEST-19.md)     | no duplicate events created during soft delete replay                                                 |
| [US-AENWID-01](US-AENWID-01.md)     | replay works with non-writable UUID primary key                                                       |
| [US-AENWID-02](US-AENWID-02.md)     | replay works with non-writable UUID after update and destroy                                          |
| [US-AEPASS-01](US-AEPASS-01.md)     | user can register with password and events are created                                                |
| [US-AEPASS-02](US-AEPASS-02.md)     | registration with mismatched passwords fails gracefully                                               |
| [US-AEPASS-03](US-AEPASS-03.md)     | user can sign in with correct password                                                                |
| [US-AEPASS-04](US-AEPASS-04.md)     | sign-in with incorrect password fails                                                                 |
| [US-AEPASS-05](US-AEPASS-05.md)     | password reset request generates token                                                                |
| [US-AEPASS-06](US-AEPASS-06.md)     | password reset request with non-existent email succeeds silently                                      |
| [US-AEPASS-07](US-AEPASS-07.md)     | user can change password with correct current password                                                |
| [US-AEPASS-08](US-AEPASS-08.md)     | password change with incorrect current password fails                                                 |
| [US-AEPASS-09](US-AEPASS-09.md)     | password change with mismatched new passwords fails                                                   |
| [US-AEPASS-10](US-AEPASS-10.md)     | password authentication events can be replayed correctly                                              |
| [US-AEPASS-11](US-AEPASS-11.md)     | password operations with system actors are properly attributed in events                              |
| [US-AEACT-01](US-AEACT-01.md)       | actor primary key is persisted                                                                        |
| [US-AEACT-02](US-AEACT-02.md)       | create action works without an actor                                                                  |
| [US-AEACT-03](US-AEACT-03.md)       | update action works without an actor                                                                  |
| [US-AEACT-04](US-AEACT-04.md)       | create action works with actor explicitly set to nil                                                  |
| [US-AEBIN-01](US-AEBIN-01.md)       | creating a resource with a binary attribute does not raise Jason.EncodeError                          |
| [US-AEBIN-02](US-AEBIN-02.md)       | binary attribute is stored in event data as base64                                                    |
| [US-AEBIN-03](US-AEBIN-03.md)       | dump_value and cast_from_embedded round-trip binary values                                            |
| [US-AEBIN-04](US-AEBIN-04.md)       | cast_from_embedded passes through nil                                                                 |
| [US-AEBIN-05](US-AEBIN-05.md)       | cast_from_embedded passes through non-binary attribute types unchanged                                |
| [US-AEDEF-01](US-AEDEF-01.md)       | update_default values are applied as expected                                                         |
| [US-AEDEF-02](US-AEDEF-02.md)       | default values work correctly with Events extension                                                   |
| [US-AEFORM-01](US-AEFORM-01.md)     | manage_relationship changes are visible for nested form generation                                    |
| [US-AEFORM-02](US-AEFORM-02.md)     | AshPhoenix nested forms work with manage_relationship on event-tracked resources                      |
| [US-AEFORM-03](US-AEFORM-03.md)     | replay works correctly for events created via nested forms with manage_relationship                   |
| [US-AEFORM-04](US-AEFORM-04.md)     | handles ash phoenix forms correctly                                                                   |
| [US-AEGEN-01](US-AEGEN-01.md)       | changeset_generator creates events with proper actor attribution                                      |
| [US-AEGEN-02](US-AEGEN-02.md)       | generate_many creates multiple records with events                                                    |
| [US-AEGEN-03](US-AEGEN-03.md)       | multiple generate calls work correctly with events                                                    |
| [US-AEGEN-04](US-AEGEN-04.md)       | seed_generator bypasses events (no events created)                                                    |
| [US-AEGEN-05](US-AEGEN-05.md)       | changeset_generator without actor fails authorization                                                 |
| [US-AEGEN-06](US-AEGEN-06.md)       | generator with custom attributes creates events correctly                                             |
| [US-AEEMB-01](US-AEEMB-01.md)       | handles embedded resources                                                                            |
| [US-AESTATE-01](US-AESTATE-01.md)   | handles ash_state_machine validations                                                                 |
| [US-AESTATE-02](US-AESTATE-02.md)   | default initial state should not be overridden when conditional state transition condition is not met |
| [US-AESTATE-03](US-AESTATE-03.md)   | upsert behavior with conditional state transitions                                                    |
| [US-AESTATE-04](US-AESTATE-04.md)   | multiple upserts without meeting transition condition keep default state                              |
| [US-AEERR-01](US-AEERR-01.md)       | unique constraint violation returns an error and writes no event                                      |
| [US-AEERR-02](US-AEERR-02.md)       | a validation with a custom message fails replay with that message                                     |
| [US-AEERR-03](US-AEERR-03.md)       | a validation without a custom message fails replay with the default message                           |
| [US-AEERR-04](US-AEERR-04.md)       | raises, keeps earlier events applied and does not apply later events                                  |
| [US-AEERR-05](US-AEERR-05.md)       | update and destroy events for a missing record log a warning and replay continues                     |
| [US-AEUPS-01](US-AEUPS-01.md)       | upsert action generates events correctly for both create and update paths                             |
| [US-AEUPS-02](US-AEUPS-02.md)       | auto-generated replay update action is created for upsert actions                                     |
| [US-AEBULK-01](US-AEBULK-01.md)     | bulk actions works as expected                                                                        |
| [US-AEBULK-02](US-AEBULK-02.md)     | bulk_create works atomically with ignored action                                                      |
| [US-AEBULK-03](US-AEBULK-03.md)     | bulk_update works atomically with ignored action                                                      |
| [US-AEBULK-04](US-AEBULK-04.md)     | bulk_destroy works atomically with ignored action                                                     |
| [US-AEBULK-05](US-AEBULK-05.md)     | bulk_create without return_notifications? should not generate missed notification warnings            |
| [US-AEBULK-06](US-AEBULK-06.md)     | bulk_destroy with soft delete works correctly                                                         |
| [US-AEBULK-07](US-AEBULK-07.md)     | bulk_destroy with soft delete and nested bulk operation works correctly                               |
| [US-AEBULK-08](US-AEBULK-08.md)     | single create without return_notifications? should work fine                                          |
| [US-AEHMANY-01](US-AEHMANY-01.md)   | creates parent with multiple children, separate events for each                                       |
| [US-AEHMANY-02](US-AEHMANY-02.md)   | replay does not duplicate children                                                                    |
| [US-AEHMANY-03](US-AEHMANY-03.md)   | adding and removing children via update, replay works                                                 |
| [US-AENOTIFY-01](US-AENOTIFY-01.md) | create actions propagate event log notifications                                                      |
| [US-AENOTIFY-02](US-AENOTIFY-02.md) | update actions propagate event log notifications                                                      |
| [US-AENOTIFY-03](US-AENOTIFY-03.md) | single destroy still delivers the record's own notification                                           |
| [US-AENOTIFY-04](US-AENOTIFY-04.md) | soft destroy actions propagate event log notifications                                                |
| [US-AENOTIFY-05](US-AENOTIFY-05.md) | bulk create returns event log notifications alongside the resource's own                              |
| [US-AENOTIFY-06](US-AENOTIFY-06.md) | bulk destroy returns event log notifications alongside the resource's own                             |
| [US-AETIME-01](US-AETIME-01.md)     | create action event occurred_at matches create_timestamp                                              |
| [US-AETIME-02](US-AETIME-02.md)     | update action event occurred_at matches update_timestamp                                              |
| [US-AETIME-03](US-AETIME-03.md)     | org create action event occurred_at matches create_timestamp                                          |
| [US-AETIME-04](US-AETIME-04.md)     | org update action event occurred_at matches update_timestamp                                          |
| [US-AETIME-05](US-AETIME-05.md)     | upsert action that creates new record uses create_timestamp for occurred_at                           |
| [US-AETIME-06](US-AETIME-06.md)     | upsert action that updates existing record uses update_timestamp for occurred_at                      |
| [US-AELOCK-01](US-AELOCK-01.md)     | advisory lock default value is used for resources without multitenancy                                |
| [US-AELOCK-02](US-AELOCK-02.md)     | advisory locks built tenant value is used for resources with multitenancy                             |
| [US-AELOCK-03](US-AELOCK-03.md)     | a failed advisory lock acquisition raises with its own error instead of a 25P02                       |
| [US-AELOCK-04](US-AELOCK-04.md)     | advisory lock generator raises on unsupported tenant type                                             |
