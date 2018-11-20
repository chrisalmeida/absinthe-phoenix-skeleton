defmodule SkeletonWeb.Router do
  use SkeletonWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api" do
    pipe_through :api

    forward "/", Absinthe.Plug,
      schema: SkeletonWeb.GraphQL.Schema,
      json_codec: Jason
  end
end
