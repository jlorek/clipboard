defmodule Clipboard.Repo.Migrations.PostBelongsToTopic do
  use Ecto.Migration

  def change do
    alter table (:posts) do
      add :topic_id, references(:topics, type: :uuid)
    end
  end
end
