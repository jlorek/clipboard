defmodule ClipboardWeb.Topic.UserListLive do
  # is a separate live_view to
  # implement it's own handle_info
  # for detecting presence changes
  use ClipboardWeb, :live_view

  alias ClipboardWeb.Presence
  alias Phoenix.Socket.Broadcast

  @impl true
  def mount(_params, session = %{"topic_id" => topic_id}, socket) do
    # IO.inspect(params, label: "user_list_live/params")
    # IO.inspect(session, label: "user_list_live/session")
    # IO.inspect(socket, label: "user_list_live/socket")

    user = create_connected_user(session)

    # Clipboard.PubSub is defined in application.ex children
    if connected?(socket) do
      Phoenix.PubSub.subscribe(Clipboard.PubSub, "topic_users:#{topic_id}")
      {:ok, _} = Presence.track(self(), "topic_users:#{topic_id}", user.uuid, user)
    end

    socket =
      socket
      |> assign(:id, socket.id)
      |> assign(:topic_id, topic_id)
      |> assign(:user, user)
      |> assign(:connected_users, [])

    {:ok, socket}
  end

  defp create_connected_user(%{"device" => device}) do
    %{
      uuid: UUID.uuid4(),
      device: device,
      name: Clipboard.TextGenerator.generate_name(),
      online_since: System.system_time(:second),
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

  # Thanks!
  # https://stackoverflow.com/a/7641812/1010496

  @minute 60
  @hour @minute * 60
  @day @hour * 24

  def fuzzy_time(timestamp) do
    now = System.system_time(:second)
    delta = now - timestamp

    cond do
      delta < 0 -> "in the future"
      delta < 30 -> "just then"
      delta < @minute -> "seconds ago"
      delta < 2 * @minute -> "a minute ago"
      delta < @hour -> "#{floor(delta / @minute)} minutes ago"
      delta < 2 * @hour -> "1 hour ago"
      delta < @day -> "#{floor(delta / @hour)} hours ago"
      delta < @day * 2 -> "yesterday"
      true -> "#{floor(delta / @day)} days ago"
    end
  end
end
