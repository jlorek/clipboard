defmodule ClipboardWeb.ClipboardLive do
  use ClipboardWeb, :live_component

  def mount(socket) do
    socket =
      socket
      |> assign(:base64, "no base64")
      |> assign(:mimetype, "no mimetype")
      |> assign(:filename, "no filename")

    {:ok, socket}
  end

  def render(assigns) do
    ~L"""
    <div
      id="<%= @id %>"
      phx-hook="clipboard"
      x-data="{
        base64: '<%= @base64 %>',
        mimetype: '<%= @mimetype %>',
        filename: '<%= @filename %>'}"
      x-subscribe
      x-init="
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

  def handle_event(
        "paste",
        %{"base64" => base64, "mimetype" => mimetype, "filename" => filename},
        socket
      ) do

    socket =
      socket
      |> assign(:base64, base64)
      |> assign(:mimetype, mimetype)
      |> assign(:filename, filename)

    {:noreply, socket}
  end
end
