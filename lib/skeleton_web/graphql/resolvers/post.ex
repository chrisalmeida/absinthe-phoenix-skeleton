defmodule SkeletonWeb.GraphQL.Resolvers.Post do

  def list_posts(_parent, _args, _resolution) do
    {:ok, []}
  end
end
