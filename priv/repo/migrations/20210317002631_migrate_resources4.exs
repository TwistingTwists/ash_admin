defmodule Demo.Repo.Migrations.MigrateResources4 do
  @moduledoc """
  Updates resources based on their most recent snapshots.

  This file was autogenerated with `mix ash_postgres.generate_migrations`
  """

  use Ecto.Migration

  def up do
    alter table(:users) do
      add :updated_at, :utc_datetime_usec, default: fragment("now()")
      add :inserted_at, :utc_datetime_usec, default: fragment("now()")
    end

    alter table(:tickets) do
      add :updated_at, :utc_datetime_usec, null: false, default: fragment("now()")
      add :inserted_at, :utc_datetime_usec, null: false, default: fragment("now()")
    end
  end

  def down do
    alter table(:tickets) do
      remove :inserted_at
      remove :updated_at
    end

    alter table(:users) do
      remove :inserted_at
      remove :updated_at
    end
  end
end