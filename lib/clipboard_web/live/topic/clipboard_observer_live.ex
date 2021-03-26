defmodule ClipboardWeb.Topic.ClipboardObserver do
  use ClipboardWeb, :live_view

  alias Clipboard.Board.Post
  alias Phoenix.Socket.Broadcast

  def mount(_params, _session = %{"topic_id" => topic_id}, socket) do
    # IO.inspect(params, label: "clipboard_live/params")
    # IO.inspect(session, label: "clipboard_live/session")
    # IO.inspect(socket, label: "clipboard_live/socket")

    Phoenix.PubSub.subscribe(Clipboard.PubSub, "topic_paste:#{topic_id}")

    existing_or_empty =
      case Clipboard.Board.get_post_for_topic(topic_id) do
        nil -> Post.empty_dummy()
        existing -> existing
      end

    # IO.inspect(existing_or_empty, label: "clipboard_live/existing_or_empty")

    socket =
      socket
      |> assign(:id, socket.id)
      |> assign(:topic_id, topic_id)
      |> assign(:base64, existing_or_empty.data)
      |> assign(:mimetype, existing_or_empty.mimetype)
      |> assign(:filename, existing_or_empty.filename)

    {:ok, socket}
  end

  def render(assigns) do
    # assigns.id gets assigned from live_component call (in TopicLive)
    ~L"""
    <template
      id="<%= @id %>"
      phx-hook="clipboard"
      x-data="{
        // shadow properties
        base64: '<%= @base64 %>',
        mimetype: '<%= @mimetype %>',
        filename: '<%= @filename %>'}"
      x-subscribe
      x-init="
        // set initial values from live view
        $store.clipboard.base64 = base64;
        $store.clipboard.mimetype = mimetype;
        $store.clipboard.filename = filename;
        // setup watcher for future values
        $watch('base64', value => { $store.clipboard.base64 = value });
        $watch('mimetype', value => { $store.clipboard.mimetype = value });
        $watch('filename', value => { $store.clipboard.filename = value });">
    </template>
    """
  end

  @doc """
  New paste data arrives from a client.
  Data is first saved and then broadcasted.
  """
  @impl true
  def handle_event(
        "paste",
        %{"base64" => base64, "mimetype" => mimetype, "filename" => filename},
        socket
      ) do
    {:ok, post} =
      Clipboard.Board.upsert_post(%{
        topic_id: socket.assigns.topic_id,
        data: base64,
        mimetype: mimetype,
        filename: filename
      })

    Phoenix.PubSub.broadcast(
      Clipboard.PubSub,
      "topic_paste:#{socket.assigns.topic_id}",
      %Broadcast{event: "post_changed", payload: post}
    )

    {:noreply, socket}
  end

  @doc """
  New paste data arrives via broadcast.
  """
  @impl true
  def handle_info(%Broadcast{event: "post_changed", payload: post}, socket) do
    socket =
      socket
      |> assign(:base64, post.data)
      |> assign(:mimetype, post.mimetype)
      |> assign(:filename, post.filename)

    {:noreply, socket}
  end
end
