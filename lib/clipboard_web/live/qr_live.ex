defmodule ClipboardWeb.QrLive do
  use ClipboardWeb, :live_view

  def mount(_params = %{"topic_hashid" => topic_hashid}, _session, socket) do
    qr = Routes.show_topic_url(socket, :existing, topic_hashid)
    |> EQRCode.encode()
    |> EQRCode.svg(viewbox: false)

    socket = assign(socket, qr: qr, topic_hashid: topic_hashid)
    {:ok, socket }
  end

  def handle_event("go_back", _params, socket) do
    socket = socket
    |> push_redirect(to: Routes.show_topic_path(socket, :existing, socket.assigns.topic_hashid))
    {:noreply, socket}
  end

  def render(assigns) do
    ~L"""
    <div class="flex flex-col space-y-4">
      <div class="text-3xl">🤖 QR Code</div>
      <div>Scan this QR code with your phone to share your clipboard.</div>
      <button class="button" phx-click="go_back">Go back</button>
      <div class="flex flex-row justify-between">
        <div></div>
        <div><%= raw(@qr) %></div>
        <div></div>
      </div>
    </div>
    """
  end
end
