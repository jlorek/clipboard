defmodule ClipboardWeb.ChildComponentLive do
  use ClipboardWeb, :live_component

  def mount(_params, _session, socket) do
    {:ok, assign(socket, id: socket.id)}
  end

  def render(assigns) do
    ~L"""
    <div x-data x-subscribe>
    child component <%= @id %>, count <span x-text="$store.clipboard.count"></span>
    </div>
    """
  end
end
