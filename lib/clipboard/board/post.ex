defmodule Clipboard.Board.Post do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "posts" do
    field :data, :string
    field :filename, :string
    field :mimetype, :string

    belongs_to :topic, Clipboard.Board.Topic

    timestamps()
  end

  @doc false
  def changeset(post, attrs) do
    post
    |> cast(attrs, [:data, :mimetype, :filename, :topic_id])
    |> validate_required([:data, :mimetype, :filename, :topic_id])
  end
end
