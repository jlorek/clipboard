defmodule ClipboardWeb.ClipboardViewLive do
  use ClipboardWeb, :live_component

  def mount(socket) do
    {:ok, socket}
  end

  def render(assigns) do
    ~L"""
    <div id="<%= @id %>"
         x-data
         x-subscribe>
      <div>Spruce base64: <span x-text="$store.clipboard.base64"></span></div>
      <div>Spruce mimetype: <span x-text="$store.clipboard.mimetype"></span></div>
      <div>Spruce filename: <span x-text="$store.clipboard.filename"></span></div>
      <button @click="">Copy to clipboard</button>
      <button @click="document.execCommand('paste');">Copy from clipboard</button>
    </div>
    """
  end
end
