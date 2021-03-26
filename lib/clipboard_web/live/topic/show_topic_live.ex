defmodule ClipboardWeb.Topic.ShowTopicLive do
  use ClipboardWeb, :live_view
  alias ClipboardWeb.Topic.{UserListLive, ClipboardObserver, ClipboardViewLive, ClipboardDataLive}

  def show_debug, do: false

  def mount(params = %{"topic_id" => topic_id}, _session, socket) do
    topic = Clipboard.Board.get_topic!(topic_id)

    socket =
      socket
      # page_title in root.html.leex
      |> assign(:page_title, topic.title)
      |> assign(:topic_id, topic.id)
      |> assign(:topic_title, topic.title)
      |> assign(:topic_url, Routes.show_topic_url(socket, :existing, topic.id))

    {:ok, socket}
  end

  def random_notes_emoji, do: ["📝", "🗒", "📓", "📘", "📕", "📒", "📔", "📗", "📙"] |> Enum.random()

end
