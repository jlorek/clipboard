defmodule ClipboardWeb.Topic.ShareLinkLive do
  use ClipboardWeb, :live_component

  @impl true
  def mount(socket) do
    {:ok, socket}
  end

  @impl true
  def update(_assigns = %{topic_id: topic_id}, socket) do
    hashid = topic_id |> Clipboard.Ids.uuid_to_hashid()
    socket = socket |> assign(:topic_hashid, hashid)
    {:ok, socket}
  end
end
