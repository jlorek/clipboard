defmodule ClipboardWeb.Plugs.UserAgentPlug do
  import Plug.Conn

  def init(options), do: options

  def call(conn, _opts) do
    ua =
      conn
      |> Plug.Conn.get_req_header("user-agent")
      |> List.first()
      |> UAParser.parse()

    # IO.inspect(ua, label: "User Agent")

    # Thanks!
    # https://github.com/phoenixframework/phoenix_live_view/issues/631#issuecomment-586172734
    conn |> put_session(:device, ua.os.family)
  end
end
