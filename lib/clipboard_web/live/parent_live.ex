defmodule ClipboardWeb.ParentLive do
  use ClipboardWeb, :live_view

  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  def render(assigns) do
    ~L"""
    <div id="parent"
        x-data="{count: 0}">
      parent, count <span x-text="count"></span>
      <br />
      <button @click="$dispatch('count-changed', {count: ++count})">Increment</button>
      <%= live_render(@socket, ClipboardWeb.ChildLive, id: "two") %>
      <%= live_render(@socket, ClipboardWeb.ChildLive, id: "two") %>
    </div>
    """
  end
  # <%= live_render(@socket, ClipboardWeb.SubLive, id: "2") %>

end
