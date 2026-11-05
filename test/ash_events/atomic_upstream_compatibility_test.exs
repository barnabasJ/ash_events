# SPDX-FileCopyrightText: 2023 ash_events contributors <https://github.com/ash-project/ash_events/graphs/contributors>
#
# SPDX-License-Identifier: MIT

defmodule AshEvents.AtomicUpstreamCompatibilityTest do
  use AshEvents.RepoCase, async: true

  alias AshEvents.Accounts
  alias AshEvents.Accounts.User
  alias AshEvents.EventLogs
  alias AshEvents.EventLogs.EventLog
  alias AshEvents.EventLogs.EventLogCloaked
  alias AshEvents.EventLogs.SystemActor

  require Ash.Query

  defmodule AtomicOrg do
    @moduledoc false
    use Ash.Resource,
      domain: AshEvents.AtomicUpstreamCompatibilityTest.Domain,
      data_layer: AshPostgres.DataLayer,
      extensions: [AshEvents.Events]

    postgres do
      table "orgs"
      repo AshEvents.TestRepo
    end

    events do
      event_log EventLog
      atomic?(true)
      ignore_actions [:create_untracked]
      create_timestamp :created_at
      update_timestamp :updated_at
    end

    actions do
      defaults [:read, :destroy]

      create :create do
        primary? true
        accept [:name, :secret_hash, :created_at, :updated_at, :active]
      end

      create :create_typed do
        accept [:active]
        argument :on_date, :date, allow_nil?: false

        change fn changeset, _context ->
          Ash.Changeset.change_attribute(
            changeset,
            :name,
            changeset |> Ash.Changeset.get_argument(:on_date) |> Date.to_iso8601()
          )
        end
      end

      create :create_untracked do
        accept [:name]
        change set_attribute(:name, "UNEXPECTED LIVE BUSINESS ACTION")
      end

      update :update do
        primary? true
        require_atomic? true
        accept [:name, :updated_at]
      end

      update :clear_secret do
        require_atomic? true
        accept []
        change set_attribute(:secret_hash, nil)
      end
    end

    attributes do
      uuid_primary_key :id
      create_timestamp :created_at, writable?: true
      update_timestamp :updated_at, writable?: true
      attribute :name, :string, allow_nil?: false, public?: true
      attribute :secret_hash, :binary, public?: true
      attribute :active, :boolean, default: true, allow_nil?: false
    end
  end

  defmodule AtomicPrivateOrg do
    @moduledoc false
    use Ash.Resource,
      domain: AshEvents.AtomicUpstreamCompatibilityTest.Domain,
      data_layer: AshPostgres.DataLayer,
      extensions: [AshEvents.Events, AshCloak]

    postgres do
      table "orgs_cloaked"
      repo AshEvents.TestRepo
    end

    cloak do
      vault(AshEvents.Vault)
      attributes([:name])
    end

    events do
      event_log EventLogCloaked
      atomic?(true)
    end

    actions do
      defaults [:read]

      create :create do
        primary? true
        accept [:name]
      end

      update :update do
        primary? true
        require_atomic? false
        accept [:name, :updated_at]
      end
    end

    attributes do
      uuid_primary_key :id
      create_timestamp :created_at
      update_timestamp :updated_at, writable?: true
      attribute :name, :string, allow_nil?: false, public?: true, sensitive?: true
    end
  end

  defmodule AtomicArticle do
    @moduledoc false
    use Ash.Resource,
      domain: AshEvents.AtomicUpstreamCompatibilityTest.Domain,
      data_layer: AshPostgres.DataLayer,
      extensions: [AshEvents.Events]

    postgres do
      table "articles"
      repo AshEvents.TestRepo
    end

    events do
      event_log EventLog
      atomic?(true)
    end

    actions do
      defaults [:read]

      create :create do
        primary? true
        accept [:title, :body]
      end

      destroy :soft_destroy do
        primary? true
        require_atomic? true
        soft? true
        change set_attribute(:deleted_at, ~U[2025-03-04 05:06:07.000000Z])
      end
    end

    attributes do
      uuid_primary_key :id
      create_timestamp :created_at
      update_timestamp :updated_at
      attribute :title, :string, allow_nil?: false, public?: true
      attribute :body, :string, public?: true
      attribute :archived_at, :utc_datetime_usec, public?: true
      attribute :deleted_at, :utc_datetime_usec, public?: true
    end
  end

  defmodule AtomicComment do
    @moduledoc false
    use Ash.Resource,
      domain: AshEvents.AtomicUpstreamCompatibilityTest.Domain,
      data_layer: AshPostgres.DataLayer,
      extensions: [AshEvents.Events]

    postgres do
      table "comments"
      repo AshEvents.TestRepo
    end

    events do
      event_log EventLog
      atomic?(true)
    end

    actions do
      defaults [:read]

      create :create do
        primary? true
        accept [:body]
        argument :user_id, :uuid, allow_nil?: false
        change manage_relationship(:user_id, :user, type: :append)
      end
    end

    attributes do
      uuid_primary_key :id
      create_timestamp :created_at
      update_timestamp :updated_at
      attribute :body, :string, allow_nil?: false, public?: true
    end

    relationships do
      belongs_to :user, User, allow_nil?: false
    end
  end

  defmodule Domain do
    @moduledoc false
    use Ash.Domain

    resources do
      resource AshEvents.AtomicUpstreamCompatibilityTest.AtomicOrg
      resource AshEvents.AtomicUpstreamCompatibilityTest.AtomicPrivateOrg
      resource AshEvents.AtomicUpstreamCompatibilityTest.AtomicArticle
      resource AshEvents.AtomicUpstreamCompatibilityTest.AtomicComment
    end
  end

  setup do
    # Use the upstream fixture's supported bootstrap actor, then the persisted user for all owned actions.
    user =
      Accounts.create_user!(
        %{
          email: "atomic-#{Ash.UUID.generate()}@example.com",
          given_name: "Atomic",
          family_name: "Compatibility",
          hashed_password: "test-only-password"
        },
        actor: %SystemActor{name: "atomic_upstream_fixture"}
      )

    %{actor: user}
  end

  @tag story: "US-AEATOM-01"
  test "live atomic actions persist one attributed event per successful action", %{actor: actor} do
    # Given a normal tracked resource with a required atomic update.
    record = create_org(actor)
    assert Ash.Resource.Info.action(AtomicOrg, :update).require_atomic?
    assert Ash.Resource.Info.action(AtomicOrg, :update).manual == nil

    # When its real update executes through Ash.
    updated =
      record
      |> Ash.Changeset.for_update(:update, %{name: "Updated"}, actor: actor)
      |> Ash.update!()

    # Then both business state and the exactly-once attributed event are persisted.
    assert Ash.get!(AtomicOrg, updated.id, actor: actor).name == "Updated"
    events = events_for(AtomicOrg, updated.id, actor)
    assert Enum.map(events, & &1.action) |> Enum.sort() == [:create, :update]
    assert Enum.all?(events, &(&1.user_id == actor.id))
  end

  @tag story: "US-AEATOM-02"
  test "private atomic companion actions reject direct create update and destroy", %{actor: actor} do
    # Given a persisted live record and generated companion actions.
    record = create_org(actor)
    original_events = events_for(AtomicOrg, record.id, actor)

    for name <- [:ash_events_replay_create, :ash_events_replay_update, :ash_events_replay_destroy] do
      refute Ash.Resource.Info.action(AtomicOrg, name).public?
    end

    # When callers use real public Ash APIs without the trusted replay context.
    outcomes = [
      AtomicOrg
      |> Ash.Changeset.for_create(:ash_events_replay_create, %{name: "Injected"}, actor: actor)
      |> Ash.create(),
      record
      |> Ash.Changeset.for_update(:ash_events_replay_update, %{name: "Injected"}, actor: actor)
      |> Ash.update(),
      record
      |> Ash.Changeset.for_destroy(:ash_events_replay_destroy, %{}, actor: actor)
      |> Ash.destroy()
    ]

    # Then the native replay-only validation rejects each call and no business or event state changes.
    for outcome <- outcomes do
      assert {:error, error} = outcome
      assert Exception.message(error) =~ "cannot be called directly"
    end

    assert Ash.get!(AtomicOrg, record.id, actor: actor).name == record.name
    assert events_for(AtomicOrg, record.id, actor) == original_events
  end

  @tag story: "US-AEATOM-03"
  test "a non-input nil clear survives event persistence and native replay", %{actor: actor} do
    # Given an atomic resource with an existing non-nil nullable attribute.
    record = create_org(actor, %{secret_hash: <<1, 2, 3>>})

    # When a real atomic action clears it without accepting it as input.
    cleared =
      record |> Ash.Changeset.for_update(:clear_secret, %{}, actor: actor) |> Ash.update!()

    event = Enum.find(events_for(AtomicOrg, record.id, actor), &(&1.action == :clear_secret))

    # Then the persisted event distinguishes an explicit nil clear from an absent field.
    assert cleared.secret_hash == nil
    assert Map.has_key?(event.changed_attributes, "secret_hash")
    assert event.changed_attributes["secret_hash"] == nil
    before_count = EventLog |> Ash.read!(actor: actor) |> length()

    # Native replay consumes the retained clear without recording a replacement event.
    assert :ok = EventLogs.replay_events!(%{}, actor: actor)
    assert Ash.get!(AtomicOrg, record.id, actor: actor).secret_hash == nil
    assert EventLog |> Ash.read!(actor: actor) |> length() == before_count
  end

  @tag story: "US-AEATOM-04"
  test "a managed belongs_to FK sharing an argument name survives event persistence and replay",
       %{actor: actor} do
    # Given a real persisted destination actor and a source whose FK is set by manage_relationship.
    record =
      AtomicComment
      |> Ash.Changeset.for_create(:create, %{body: "Managed FK", user_id: actor.id}, actor: actor)
      |> Ash.create!()

    # When the normal atomic recorder persists the source event.
    [event] = events_for(AtomicComment, record.id, actor)

    # Then it keeps the resulting FK even though the input argument has the same name.
    assert event.changed_attributes["user_id"] == actor.id
    assert event.user_id == actor.id
    before_count = EventLog |> Ash.read!(actor: actor) |> length()

    # Native replay omits relationship side effects but restores the actual FK from the event.
    assert :ok = EventLogs.replay_events!(%{}, actor: actor)
    assert Ash.get!(AtomicComment, record.id, actor: actor).user_id == actor.id
    assert EventLog |> Ash.read!(actor: actor) |> length() == before_count
  end

  @tag story: "US-AEATOM-05"
  test "a failed stale atomic destroy records no replacement event", %{actor: actor} do
    # Given a real tracked record whose first destroy succeeds.
    record = create_org(actor)
    assert :ok = Ash.destroy(record, actor: actor)

    # When the original stale record is destroyed again through the normal API.
    assert {:error, _error} = Ash.destroy(record, actor: actor)

    # Then only the successful destroy has an attributed persisted event.
    destroys = Enum.filter(events_for(AtomicOrg, record.id, actor), &(&1.action == :destroy))
    assert length(destroys) == 1
    assert hd(destroys).user_id == actor.id
  end

  @tag story: "US-AEATOM-06"
  test "typed string inputs survive public creation event persistence and native replay", %{
    actor: actor
  } do
    # Given raw date and boolean strings accepted by the real source action.
    record =
      AtomicOrg
      |> Ash.Changeset.for_create(
        :create_typed,
        %{on_date: "2030-02-03", active: "false"},
        actor: actor
      )
      |> Ash.create!()

    [event] = events_for(AtomicOrg, record.id, actor)

    # When the shared native recorder casts and stores the action input.
    assert event.data["on_date"] == "2030-02-03"
    assert event.data["active"] == false
    assert record.name == "2030-02-03"
    assert record.active == false

    # Then native replay reconstructs the same typed business state.
    assert :ok = EventLogs.replay_events!(%{}, actor: actor)
    restored = Ash.get!(AtomicOrg, record.id, actor: actor)
    assert restored.name == record.name
    assert restored.active == false
  end

  @tag story: "US-AEATOM-07"
  test "cloaked sensitive input persists encrypted and survives native replay", %{actor: actor} do
    # Given sensitive input on a real cloaked atomic-mode source.
    first_secret = "initial-private-#{Ash.UUID.generate()}"
    final_secret = "updated-private-#{Ash.UUID.generate()}"

    record =
      AtomicPrivateOrg
      |> Ash.Changeset.for_create(:create, %{name: first_secret}, actor: actor)
      |> Ash.create!()

    changeset = Ash.Changeset.for_update(record, :update, %{name: final_secret}, actor: actor)
    refute inspect(changeset) =~ final_secret
    updated = Ash.update!(changeset)

    # When its persisted event is read through native decrypted calculations.
    events = cloaked_events_for(record.id, actor)
    update = Enum.find(events, &(&1.action == :update))
    assert update.data["name"] == final_secret
    assert update.user_id == actor.id
    refute inspect(update.metadata) =~ final_secret

    # Then storage and inspection reveal no plaintext, while replay retains the sensitive value.
    for event <- events,
        field <- [:encrypted_data, :encrypted_changed_attributes, :encrypted_metadata] do
      ciphertext = Map.fetch!(event, field)
      assert is_binary(ciphertext)
      refute String.contains?(ciphertext, first_secret)
      refute String.contains?(ciphertext, final_secret)
    end

    refute inspect(update) =~ final_secret
    assert :ok = EventLogs.replay_events_cloaked!(%{}, actor: actor)

    restored =
      AtomicPrivateOrg |> Ash.get!(updated.id, actor: actor) |> Ash.load!([:name], actor: actor)

    assert restored.name == final_secret
  end

  @tag story: "US-AEATOM-08"
  test "an update event uses its fixed update timestamp instead of creation time", %{actor: actor} do
    # Given deliberately distinct fixed creation and update timestamps.
    created_at = ~U[2020-01-02 03:04:05.000000Z]
    updated_at = ~U[2021-02-03 04:05:06.000000Z]
    record = create_org(actor, %{created_at: created_at, updated_at: created_at})

    # When the real required-atomic update stores the later fixed timestamp.
    updated =
      record
      |> Ash.Changeset.for_update(:update, %{name: "Timestamped", updated_at: updated_at},
        actor: actor
      )
      |> Ash.update!()

    event = Enum.find(events_for(AtomicOrg, record.id, actor), &(&1.action == :update))

    # Then event time matches the actual updated record, without elapsed-time waits.
    assert updated.updated_at == updated_at
    assert event.occurred_at == updated_at
    refute event.occurred_at == created_at
  end

  @tag story: "US-AEATOM-09"
  test "the single action callback returns its event notifications through Ash", %{actor: actor} do
    # Given a real source create with a managed relationship.
    changeset =
      Ash.Changeset.for_create(AtomicComment, :create, %{body: "Notified", user_id: actor.id},
        actor: actor,
        context: %{ash_events_metadata: %{source: "public callback"}}
      )

    # When the caller requests native notifications.
    {record, notifications} = Ash.create!(changeset, return_notifications?: true)

    # Then exactly one source event notification is returned alongside persisted event state.
    events =
      Enum.filter(notifications, &(&1.resource == EventLog and &1.data.resource == AtomicComment))

    assert length(events) == 1
    assert hd(events).data.record_id == record.id
    assert hd(events).data.metadata["source"] == "public callback"
    assert length(events_for(AtomicComment, record.id, actor)) == 1
  end

  @tag story: "US-AEATOM-10"
  test "the atomic batch callback returns each event notification through native bulk update", %{
    actor: actor
  } do
    # Given two real records and an action that requires atomic execution.
    records = [create_org(actor), create_org(actor)]
    ids = Enum.map(records, & &1.id)
    query = AtomicOrg |> Ash.Query.filter(id in ^ids)

    # When the native atomic bulk pipeline returns records and notifications.
    result =
      Ash.bulk_update(query, :update, %{name: "Atomic batch"},
        actor: actor,
        strategy: :atomic,
        return_records?: true,
        return_notifications?: true,
        return_errors?: true
      )

    # Then exactly two returned event notifications identify the two successful updates.
    assert result.status == :success
    assert Enum.sort(Enum.map(result.records, & &1.id)) == Enum.sort(ids)

    notifications =
      Enum.filter(
        result.notifications,
        &(&1.resource == EventLog and &1.data.resource == AtomicOrg)
      )

    assert Enum.sort(Enum.map(notifications, & &1.data.record_id)) == Enum.sort(ids)

    for record <- records do
      assert Ash.get!(AtomicOrg, record.id, actor: actor).name == "Atomic batch"
      assert Enum.count(events_for(AtomicOrg, record.id, actor), &(&1.action == :update)) == 1
    end
  end

  @tag story: "US-AEATOM-11"
  test "native replay preserves a soft destroy rather than deleting its row", %{actor: actor} do
    # Given a real atomic-mode soft destroy with a fixed recorded deletion value.
    record =
      AtomicArticle
      |> Ash.Changeset.for_create(:create, %{title: "Soft", body: "Retained"}, actor: actor)
      |> Ash.create!()

    assert Ash.Resource.Info.action(AtomicArticle, :ash_events_replay_soft_destroy).soft?

    assert :ok =
             record
             |> Ash.Changeset.for_destroy(:soft_destroy, %{}, actor: actor)
             |> Ash.destroy()

    # When native replay consumes the create and soft-destroy events.
    assert :ok = EventLogs.replay_events!(%{}, actor: actor)

    # Then the row remains present with the exact recorded soft-delete state.
    restored = Ash.get!(AtomicArticle, record.id, actor: actor)
    assert restored.body == "Retained"
    assert restored.deleted_at == ~U[2025-03-04 05:06:07.000000Z]

    assert Enum.count(events_for(AtomicArticle, record.id, actor), &(&1.action == :soft_destroy)) ==
             1
  end

  @tag story: "US-AEATOM-12"
  test "a historical atomic event without a companion fails contextually instead of running business changes",
       %{actor: actor} do
    # Given an actual stored event for a now-untracked action that still has live business changes.
    historical_id = Ash.UUID.generate()

    event =
      EventLog
      |> Ash.Changeset.for_create(
        :create,
        %{
          record_id: historical_id,
          resource: AtomicOrg,
          action: :create_untracked,
          action_type: :create,
          version: 42,
          occurred_at: ~U[2025-01-02 03:04:05.000000Z],
          data: %{name: "Historical"},
          changed_attributes: %{id: historical_id},
          metadata: %{},
          user_id: actor.id
        },
        actor: actor
      )
      |> Ash.create!()

    # When the public replay action cannot find the dedicated companion.
    error = assert_raise Ash.Error.Unknown, fn -> EventLogs.replay_events(%{}, actor: actor) end

    # Then it names the incompatible stored event and never re-enters the live source action.
    message = Exception.message(error)
    assert message =~ "Missing atomic replay companion"
    assert message =~ inspect(event.id)
    assert message =~ "create_untracked"
    assert message =~ "42"

    assert {:error, %Ash.Error.Invalid{errors: [%Ash.Error.Query.NotFound{}]}} =
             Ash.get(AtomicOrg, historical_id, actor: actor)

    assert length(events_for(AtomicOrg, historical_id, actor)) == 1
  end

  @tag story: "US-AEATOM-13"
  test "unsupported tracked atomic upserts are rejected by the native DSL transformer" do
    # Given a unique resource definition requesting an unsupported atomic upsert contract.
    name = Module.concat(__MODULE__, "Upsert#{System.unique_integer([:positive])}")

    definition =
      quote do
        defmodule unquote(name) do
          use Ash.Resource,
            domain: nil,
            data_layer: Ash.DataLayer.Ets,
            extensions: [AshEvents.Events]

          events do
            event_log AshEvents.EventLogs.EventLog
            atomic?(true)
          end

          attributes do
            uuid_primary_key :id
            attribute :name, :string
          end

          actions do
            defaults [:read]

            create :create do
              upsert? true
              accept [:name]
            end
          end
        end
      end

    # When the ordinary compiler applies the native extension transformer.
    # Then it rejects the configuration explicitly before any action can run.
    error =
      assert_raise Spark.Error.DslError, fn ->
        ExUnit.CaptureIO.capture_io(:stderr, fn -> Code.compile_quoted(definition) end)
      end

    assert error.message =~ "Atomic event recording does not support upsert actions"
    assert error.path == [:actions, :create, :create]
  end

  @tag story: "US-AEATOM-14"
  test "an unrelated update does not copy unchanged non-input sensitive values into its event", %{
    actor: actor
  } do
    # Given a real cloaked record with a selected sensitive value.
    secret = "unrelated-sensitive-#{Ash.UUID.generate()}"

    record =
      AtomicPrivateOrg
      |> Ash.Changeset.for_create(:create, %{name: secret}, actor: actor)
      |> Ash.create!()

    # When only an unrelated timestamp changes.
    record
    |> Ash.Changeset.for_update(:update, %{updated_at: ~U[2025-01-02 03:04:05.000000Z]},
      actor: actor
    )
    |> Ash.update!()

    update = Enum.find(cloaked_events_for(record.id, actor), &(&1.action == :update))

    # Then the decrypted update payload omits both plaintext and unchanged encrypted sensitive fields.
    refute Map.has_key?(update.changed_attributes, "name")
    refute Map.has_key?(update.changed_attributes, "encrypted_name")
    refute inspect(update.data) =~ secret
    refute inspect(update.changed_attributes) =~ secret
  end

  defp cloaked_events_for(record_id, actor) do
    EventLogCloaked
    |> Ash.Query.filter(record_id == ^record_id)
    |> Ash.Query.load([:data, :changed_attributes, :metadata])
    |> Ash.read!(actor: actor)
  end

  defp create_org(actor, attrs \\ %{}) do
    AtomicOrg
    |> Ash.Changeset.for_create(:create, Map.merge(%{name: "Original"}, attrs), actor: actor)
    |> Ash.create!()
  end

  defp events_for(resource, record_id, actor) do
    EventLog
    |> Ash.Query.filter(resource == ^resource and record_id == ^record_id)
    |> Ash.read!(actor: actor)
    |> Enum.sort_by(& &1.id)
  end
end
