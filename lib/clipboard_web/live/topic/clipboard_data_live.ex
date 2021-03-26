defmodule ClipboardWeb.Topic.ClipboardDataLive do
  use ClipboardWeb, :live_component

  def show_debug, do: false

  def mount(socket) do
    {:ok, socket}
  end
end
