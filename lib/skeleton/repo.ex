defmodule Skeleton.Repo do
  use Ecto.Repo,
    otp_app: :skeleton,
    adapter: Ecto.Adapters.Postgres
end
