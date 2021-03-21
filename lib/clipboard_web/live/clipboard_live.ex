defmodule ClipboardWeb.ClipboardLive do
  use ClipboardWeb, :live_component

  def mount(params, session, socket) do
    {:ok, socket}
  end

  def render(assigns) do
    ~L"""
    <div>This is your clipboard instance</div>
    """
  end
end
