# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :wiki,
  ecto_repos: [Wiki.Repo]

# Configures the endpoint
config :wiki, WikiWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "s+D5Ng2lNOoRXwB2O/xZfu9YxsCuuNskkR3SQIjdL1/yjkNvM7jSPTUam0tGGfV2",
  render_errors: [view: WikiWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Wiki.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
