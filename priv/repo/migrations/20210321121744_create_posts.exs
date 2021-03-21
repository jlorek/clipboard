defmodule Clipboard.Repo.Migrations.CreatePosts do
  use Ecto.Migration

  def change do
    create table(:posts, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :data, :string
      add :mimetype, :string
      add :filename, :string

      timestamps()
    end

  end
end
