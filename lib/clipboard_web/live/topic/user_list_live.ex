defmodule ClipboardWeb.Topic.UserListLive do
  # is a separate live_view to
  # implement it's own handle_info
  # for detecting presence changes
  use ClipboardWeb, :live_view

  alias ClipboardWeb.Presence
  alias Phoenix.Socket.Broadcast

  def mount(params, session = %{"topic_id" => topic_id}, socket) do
    # IO.inspect(params, label: "user_list_live/params")
    # IO.inspect(session, label: "user_list_live/session")
    # IO.inspect(socket, label: "user_list_live/socket")

    # Clipboard.PubSub is defined in application.ex children
    Phoenix.PubSub.subscribe(Clipboard.PubSub, "topic_users:#{topic_id}")

    user = create_connected_user()

    {:ok, _} =
      Presence.track(self(), "topic_users:#{topic_id}", user.uuid, %{
        name: user.name,
        online_at: inspect(System.system_time(:second))
      })

    socket =
      socket
      |> assign(:id, socket.id)
      |> assign(:topic_id, topic_id)
      |> assign(:user, user)
      |> assign(:connected_users, [])

    {:ok, socket}
  end

  defp create_connected_user do
    %{
      uuid: UUID.uuid4(),
      name: Clipboard.TextGenerator.generate_name()
    }
  end

  @impl true
  def handle_info(%Broadcast{event: "presence_diff"}, socket) do
    {:noreply,
     socket
     |> assign(:connected_users, list_present(socket))}
  end

  defp list_present(socket) do
    Presence.list("topic_users:#{socket.assigns.topic_id}")
    |> IO.inspect()
    # %{
    #   "0b20d480-5c21-4141-ac1e-9c74caf06784" => %{
    #     metas: [%{phx_ref: "FmeeAgHwYNDfjhIE"}]
    #   },
    #   "6e667683-ab56-42a8-9760-e360ed4b0871" => %{
    #     metas: [%{phx_ref: "FmeeBf3zKmjfjhKC"}]
    #   }
    # }
    # Phoenix Presence provides nice metadata, but we don't need it.
    # |> Enum.map(fn {k, _} -> k end)
    |> Enum.map(fn {key, details} -> List.first(details.metas) |> Map.put(:uuid, key) end)
  end
end
