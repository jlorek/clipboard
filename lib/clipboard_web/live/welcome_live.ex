defmodule ClipboardWeb.WelcomeLive do
  use ClipboardWeb, :live_view

  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  def handle_event("new_topic", _params, socket) do
    # socket =
    #   socket
    #   |> redirect(to: Routes.topic_path(socket, :new))

    socket = case Clipboard.Board.create_topic() do
      {:ok, topic} -> push_redirect(socket, to: Routes.show_topic_path(socket, :existing, topic.id))
      {:error, _} -> raise "Could not created new topic"
    end

    {:noreply, socket}
  end

  def render(assigns) do
    ~L"""
    <h1>Welcome 👋</h1>
    <button phx-click="new_topic">New Clipboard</button>
    """
  end
end
