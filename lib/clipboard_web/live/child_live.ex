defmodule ClipboardWeb.ChildLive do
  use ClipboardWeb, :live_view

  def mount(_params, _session, socket) do
    {:ok, assign(socket, id: socket.id)}
  end

  def render(assigns) do
    ~L"""
    <div id="child-<%= @id %>"
         x-data="{count: 0}"
         @count-changed.window="count = $event.detail.count">
    child <%= @id %>, count <span x-text="count"></span>
    </div>
    """
  end
end
