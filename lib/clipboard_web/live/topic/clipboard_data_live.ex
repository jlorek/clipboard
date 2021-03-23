defmodule ClipboardWeb.Topic.ClipboardDataLive do
  use ClipboardWeb, :live_component

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
             x-text="Clipboard.decodeDataUrl($store.clipboard.base64)"></pre>

        <img x-show="$store.clipboard.mimetype.startsWith('image/')"
             x-bind:src="$store.clipboard.base64"></pre>

        <button @click="document.execCommand('paste');">Copy from clipboard</button>

        <button x-show="$store.clipboard.mimetype.startsWith('text/')"
                x-on:click="
                  Clipboard.copyToClipboard(Clipboard.decodeDataUrl($store.clipboard.base64));
                  $store.clipboard.newdata = false;"
                x-text="'Copy to clipboard ' + $store.clipboard.newdata"></button>

        <a x-show="$store.clipboard.filename != ''"
           x-bind:download="$store.clipboard.filename"
           x-bind:href="$store.clipboard.base64">Download File</a>

        <pre style="white-space: pre-wrap;" x-text="'newdata: ' + $store.clipboard.newdata"></pre>
        <pre style="white-space: pre-wrap;" x-text="'base64: ' + $store.clipboard.base64"></pre>
        <pre style="white-space: pre-wrap;" x-text="'mimetype: ' + $store.clipboard.mimetype"></pre>
        <pre style="white-space: pre-wrap;" x-text="'filename: ' + $store.clipboard.filename"></pre>
      </div>
    </div>
    """
  end
end
