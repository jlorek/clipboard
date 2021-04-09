defmodule ClipboardWeb.FaqLive do
  use ClipboardWeb, :live_view

  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  def handle_event("new_topic", _params, socket) do
    socket =
      case Clipboard.Board.create_topic() do
        {:ok, topic} ->
          hashid = Clipboard.Ids.uuid_to_hashid(topic.id)
          push_redirect(socket, to: Routes.show_topic_path(socket, :existing, hashid))

        {:error, _} ->
          raise "Could not created new topic"
      end

    {:noreply, socket}
  end
end
