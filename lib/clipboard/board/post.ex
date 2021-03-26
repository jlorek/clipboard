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
    # when pasting files, some browsers may ommit the mimetype for certain content
    # https://developer.mozilla.org/en-US/docs/Web/HTTP/Basics_of_HTTP/Data_URIs
    # The mediatype is a MIME type string, such as 'image/jpeg' for a JPEG image file. If omitted, defaults to text/plain;charset=US-ASCII
    |> validate_required([:data, :filename, :topic_id])
  end

  def empty_dummy() do
    welcome_message =
      Base.encode64("Your cloud clipboard is ready! Try pasting text, images or files ✌️")

    %Clipboard.Board.Post{
      data: "data:text/plain;base64,#{welcome_message}",
      filename: "welcome.txt",
      mimetype: "text/plain"
    }
  end
end
