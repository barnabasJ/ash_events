<!--
SPDX-FileCopyrightText: 2023 ash_events contributors <https://github.com/ash-project/ash_events/graphs/contributors>

SPDX-License-Identifier: MIT
-->

# Atomic event recording

The maintained fork supports `atomic? true` in the resource's `events` section.
This mode appends `AshEvents.Events.Changes.RecordEvent` to tracked actions. The
action keeps its own atomic requirements and business changes. The change passes
the original changeset and actual successful result to
`AshEvents.Events.ActionWrapperHelpers.create_event!/6`. Manual wrappers retain
the existing `create_event!/5` contract.

The native input-capture change runs before source changes. Atomic mode keeps
its transient original input in extension-private context, outside normal
changeset inspection and persisted event metadata. The recorder uses that
capture when it exists. This preserves input that source encryption removes from
the final changeset parameters before recording the event.

Pass the actor to the source action. The recorder copies configured actor
primary keys into the event row and propagates the source tenant to event
creation. The shared helper casts and dumps raw input, preserves configured
event encryption, acquires the configured native transaction advisory lock and
returns collected native notifications. The successful result supplies evaluated
non-input values. Explicit nil clears remain present in `changed_attributes`. A
resulting belongs-to foreign key is retained when its source action has an
argument with that attribute's name.

For updates, the result-aware path compares loaded prior values or uses known
affected keys when prior data is unavailable. It omits unchanged unrelated
sensitive fields. Sensitive changed values are retained only for cloaked logs.
Unloaded or forbidden fields are omitted. Source actor, tenant, tracer and event
metadata follow the native change context.

Create events select the configured creation timestamp from the successful
result. Update events select its configured update timestamp. Destroy events
retain the native current-time behavior. The adapter returns notifications in
the native single-action or batch callback shape.

`AshEvents.EventLog.Actions.Replay.run/3` selects a dedicated
`ash_events_replay_<action>` companion for an atomic resource. These companions
are private and use `AshEvents.Events.Validations.ReplayOnly`. Normal calls
without the native replay context fail before the data layer executes. Replay
restores the original primary key and recorded attributes through the native
replay changes. Soft-destroy companions retain their soft-destroy flag. Replay
does not record another event for that companion. If an atomic companion is
missing, replay raises a contextual error. Use an explicit versioned replay
override for historical events whose actions changed. Manual resources keep
their original replay routing.

Tracked atomic upserts are rejected by the DSL transformer. Use native manual
event recording or exclude the upsert action from tracking until that contract
has explicit atomic replay support.

Normal create/update/destroy actions still use their original action changes.
The `atomic?` option does not make an inherently non-atomic action atomic.

The [developer stories](../user/developer/atomic-event-contracts/README.md)
describe the owned public-action and persisted-replay regression cases.
