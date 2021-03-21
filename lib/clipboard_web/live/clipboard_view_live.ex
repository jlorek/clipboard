defmodule ClipboardWeb.ClipboardViewLive do
  use ClipboardWeb, :live_component

  def mount(socket) do
    {:ok, socket}
  end

  def render(assigns) do
    ~L"""
    <div id="child-<%= @id %>"
         x-data
         x-subscribe>
      Clipboard base64 <span x-text="$store.clipboard.base64"></span>
      Clipboard mimetype <span x-text="$store.clipboard.mimetype"></span>
      Clipboard filename <span x-text="$store.clipboard.filename"></span>
    </div>
    """
  end
end
