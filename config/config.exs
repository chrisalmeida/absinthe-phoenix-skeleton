# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :skeleton,
  ecto_repos: [Skeleton.Repo]

# Configures the endpoint
config :skeleton, SkeletonWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "CAVfjG9wMLg5TIUw4sSf9fw20MvJQVS7vnJuPDpHG7U92r19ytc0BL8kP6w7dXXk",
  render_errors: [view: SkeletonWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: Skeleton.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
