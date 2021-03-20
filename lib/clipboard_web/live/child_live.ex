defmodule ClipboardWeb.ChildLive do
  use ClipboardWeb, :live_view

  def mount(_params, _session, socket) do
    {:ok, assign(socket, id: socket.id)}
  end

  def render(assigns) do
    ~L"""
    <div id="child-<%= @id %>"
         x-data="{}"
         x-subscribe>
    child <%= @id %>, count <span x-text="$store.clipboard.count"></span>
    </div>
    """
  end
end
