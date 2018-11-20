defmodule SkeletonWeb.Router do
  use SkeletonWeb, :router
  require Logger

  pipeline :api do
    plug :accepts, ["json"]
    plug :verify_jwt
  end

  scope "/api" do
    pipe_through :api

    forward "/", Absinthe.Plug,
      schema: SkeletonWeb.GraphQL.Schema,
      json_codec: Jason
  end

  @doc """
    Verify that signed JWT was sent with request
    and that there is a user with an ID in JWT
  """
  defp verify_jwt(conn, _) do
    with ["Bearer: " <> auth] <- Plug.Conn.get_req_header(conn, "authorization"),
         {:ok, %{"user" => %{"id" => id} = user}} <- Skeleton.Token.verify_and_validate(auth),
         false <- is_nil(id) do
      put_private(conn, :absinthe, %{context: user})
    else
      e ->
        Logger.error(fn ->
          h = Plug.Conn.get_req_header(conn, "authorization")

          "ip: #{conn.host} path: #{conn.request_path} error: #{inspect(e)} authorization: #{
            inspect(h)
          }"
        end)

        Plug.Conn.send_resp(conn, 403, Jason.encode!(%{error: "unauthorized"}))
        |> Plug.Conn.halt()
    end
  end
end
