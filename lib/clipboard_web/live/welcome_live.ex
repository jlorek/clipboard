defmodule ClipboardWeb.WelcomeLive do
  use ClipboardWeb, :live_view

  def mount(_params, _session, socket) do
    slogan =
      case connected?(socket) do
        false -> "..."
        true -> Clipboard.SloganGenerator.generate_slogan()
      end

    socket = socket |> assign(:slogan, slogan)
    {:ok, socket}
  end

  def handle_event("new_topic", _params, socket) do
    socket =
      case Clipboard.Board.create_topic() do
        {:ok, topic} ->
          push_redirect(socket, to: Routes.show_topic_path(socket, :existing, topic.id))

        {:error, _} ->
          raise "Could not created new topic"
      end

    {:noreply, socket}
  end
end
