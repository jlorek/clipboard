defmodule ClipboardWeb.Topic.ShowTopicLive do
  use ClipboardWeb, :live_view
  alias ClipboardWeb.Topic.{UserListLive, ClipboardLive, ClipboardViewLive, ClipboardDataLive}

  def mount(params = %{"topic_id" => topic_id}, _session, socket) do
    topic = Clipboard.Board.get_topic!(topic_id)

    socket =
      socket
      |> assign(:topic_id, topic.id)
      |> assign(:topic_title, topic.title)

    {:ok, socket}
  end

  # # socket.assigns.live_action guard?
  # def mount(_params, _session, socket = %{assigns: %{live_action: :new}}) do
  #   socket =
  #     case Clipboard.Board.create_topic() do
  #       {:ok, topic} -> redirect(socket, to: Routes.topic_path(socket, :existing, topic.id))
  #       {:error, _} -> raise "Could not created new topic"
  #     end

  #   {:ok, socket}
  # end

  def render(assigns) do
    ~L"""
    <h1><%= @topic_title %> 🐣</h1>
    <div>
      <%= live_render(@socket, UserListLive, id: "user_list", session: %{"topic_id" => assigns.topic_id}) %>
      <%= live_render(@socket, ClipboardLive, id: "clipboard", session: %{"topic_id" => assigns.topic_id}) %>
      <%= live_component(@socket, ClipboardDataLive, id: "clipboard_data") %>
      </div>
      <h4>Debug Data</h4>
      <pre>
      @live_action = <%= @live_action %>
      </pre>
      """
  end
end
