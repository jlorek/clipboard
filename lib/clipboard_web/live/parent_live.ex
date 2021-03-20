defmodule ClipboardWeb.ParentLive do
  use ClipboardWeb, :live_view

  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  def render(assigns) do
    ~L"""
    <div id="parent"
        x-data="{}"
        x-subscribe>
      parent, count <span x-text="$store.clipboard.count"></span>
      <br />
      <button @click="$store.clipboard.count++">Increment</button>
      <%= live_render(@socket, ClipboardWeb.ChildLive, id: "two") %>
      <%= live_render(@socket, ClipboardWeb.ChildLive, id: "two") %>
    </div>
    """
  end
end
