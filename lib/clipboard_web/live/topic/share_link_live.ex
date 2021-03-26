defmodule ClipboardWeb.Topic.ShareLinkLive do
  use ClipboardWeb, :live_component

  def show_debug, do: false

  def mount(socket) do
    {:ok, socket}
  end

  def update(assigns, socket) do
    socket = socket |> assign(:topic_id, assigns.topic_id)
    {:ok, socket}
  end
end
