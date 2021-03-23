defmodule ClipboardWeb.Topic.ClipboardLive do
  use ClipboardWeb, :live_component
  alias Clipboard.Board.Post

  def mount(socket) do
    {:ok, socket}
  end

  def update(assigns, socket) do
    maybe_existing =
      case Clipboard.Board.get_post_for_topic(assigns.topic_id) do
        nil -> %Post{}
        existing -> existing
      end

    IO.inspect(maybe_existing, label: "maybe existing post")

    socket =
      socket
      # when defining update/2 id (and other parameters) must be
      # passed manually from assigns to socket
      |> assign(:id, assigns.id)
      |> assign(:topic_id, assigns.topic_id)
      |> assign(:base64, maybe_existing.data)
      |> assign(:mimetype, maybe_existing.mimetype)
      |> assign(:filename, maybe_existing.filename)

    {:ok, socket}
  end

  def render(assigns) do
    # assigns.id gets assigned from live_component call (in TopicLive)
    ~L"""
    <div
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
      <h3>This is your clipboard instance with id <%= @id %></h3>
      <button phx-click="where-am-i" phx-target="#<%= @id %>">Send</button>
    </div>
    """
  end

  def handle_event("where-am-i", _params, socket) do
    IO.puts("you are here!")
    {:noreply, socket}
  end

  # new data arrives from one client
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

    socket =
      socket
      |> assign(:base64, post.data)
      |> assign(:mimetype, post.mimetype)
      |> assign(:filename, post.filename)

    {:noreply, socket}
  end
end
