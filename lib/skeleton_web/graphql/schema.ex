defmodule SkeletonWeb.GraphQL.Schema do
  use Absinthe.Schema
  import_types(SkeletonWeb.GraphQL.Types)
  alias SkeletonWeb.GraphQL.Resolvers

  query do
    @desc "Get all posts"
    field :posts, list_of(:post) do
      resolve(&Resolvers.Post.list_posts/3)
    end
  end
end
