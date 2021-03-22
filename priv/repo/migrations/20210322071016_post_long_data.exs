defmodule Clipboard.Repo.Migrations.PostLongData do
  use Ecto.Migration

  def change do
    # https://stackoverflow.com/a/42824296/1010496
    alter table(:posts) do
      modify(:data, :text)
    end
  end
end
