defmodule ClipboardWeb.Topic.ShowTopicLive do
  use ClipboardWeb, :live_view
  alias ClipboardWeb.Topic.{UserListLive, ClipboardObserver, ClipboardDataLive, ShareLinkLive}

  def show_debug, do: false

  @impl true
  def mount(_params = %{"topic_hashid" => topic_hashid}, _session, socket) do
    socket =
      if connected?(socket) do
        topic =
          topic_hashid
          |> IO.inspect(label: "Received HashId")
          |> Clipboard.Ids.hashid_to_uuid()
          |> IO.inspect(label: "Transformed Uuid")
          |> Clipboard.Board.get_topic!()

        socket
        |> assign(:loading, false)
        # page_title in root.html.leex
        |> assign(:page_title, topic.title)
        |> assign(:topic_id, topic.id)
        |> assign(:topic_title, topic.title)
      else
        socket
        |> assign(:loading, true)
        |> assign(:page_title, "preparing")
      end

    {:ok, socket}
  end

  def random_notes_emoji, do: ["📝", "🗒", "📓", "📘", "📕", "📒", "📔", "📗", "📙"] |> Enum.random()
end
