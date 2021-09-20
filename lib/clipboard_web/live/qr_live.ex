defmodule ClipboardWeb.QrLive do
  use ClipboardWeb, :live_view

  def mount(_params = %{"topic_hashid" => topic_hashid}, _session, socket) do
    qr = Routes.show_topic_url(socket, :existing, topic_hashid)
    |> EQRCode.encode()
    |> EQRCode.svg(viewbox: true)

    socket = assign(socket, qr: qr, topic_hashid: topic_hashid)
    {:ok, socket }
  end

  def render(assigns) do
    ~L"""
    <div class="flex flex-col space-y-4">
      <div class="text-3xl">🤖 QR Code</div>
      <div><%= live_redirect "Get back to your clipboard...", to: Routes.show_topic_path(@socket, :existing, assigns.topic_hashid) %></div>
      <div><%= raw(@qr) %></div>
    </div>
    """
  end
end
