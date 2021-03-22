defmodule ClipboardWeb.TopicLive do
  use ClipboardWeb, :live_view

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
    <%= live_component(@socket, ClipboardWeb.ClipboardLive, id: "clipboard", topic_id: assigns.topic_id) %>
    <%= live_component(@socket, ClipboardWeb.ClipboardViewLive, id: "clipboard_view") %>
    </div>
    <h4>Debug Data</h4>
    <pre>
    @live_action = <%= @live_action %>
    </pre>
    """
  end

  # def handle_event(
  #       "paste",
  #       %{"data" => data, "mimetype" => mimetype, "filename" => filename},
  #       socket
  #     ) do
  #   socket =
  #     socket
  #     |> assign(:data, data)
  #     |> assign(:mimetype, mimetype)
  #     |> assign(:filename, filename)

  #   {:noreply, socket}
  # end
end
