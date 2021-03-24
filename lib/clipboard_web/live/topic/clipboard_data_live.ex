defmodule ClipboardWeb.Topic.ClipboardDataLive do
  use ClipboardWeb, :live_component

  def show_debug, do: false

  def mount(socket) do
    {:ok, socket}
  end

  def render(assigns) do
    ~L"""
    <div id="<%= @id %>"
         x-data
         x-subscribe>

      <div x-show="$store.clipboard.base64 != ''">
        <pre style="white-space: pre-wrap;"
             x-show="$store.clipboard.mimetype.startsWith('text/')"
             x-text="Utils.decodeDataUrl($store.clipboard.base64)"></pre>

        <img x-show="$store.clipboard.mimetype.startsWith('image/')"
             x-bind:src="$store.clipboard.base64"></pre>

        <button @click="document.execCommand('paste');">Paste to cloud</button>

        <button x-show="$store.clipboard.mimetype.startsWith('text/')"
                x-on:click="
                  Clipboard.copyToClipboard(Utils.decodeDataUrl($store.clipboard.base64));
                  $store.clipboard.newdata = false;"
                x-text="'Copy to local clipboard ' + ($store.clipboard.newdata ? '' : '✔️')"></button>

        <a x-show="$store.clipboard.filename != ''"
           x-bind:download="$store.clipboard.filename"
           x-bind:href="$store.clipboard.base64">Download File</a>

        <%= if (show_debug) do %>
        <pre x-text="JSON.stringify($store.clipboard)"
             style="white-space: pre-wrap; overflow-wrap: break-word;"</pre>
        <% end%>

      </div>
    </div>
    """
  end
end
