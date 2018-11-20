defmodule SkeletonWeb.GraphQL.Types do
  use Absinthe.Schema.Notation

  object :post do
    field :id, :id
    field :title, :string
    field :body, :string
  end
end
