# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :dashboard,
  ecto_repos: [Dashboard.Repo]

# Configures the endpoint
config :dashboard, DashboardWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "l3pqKN1Jn+0Pl4oi4vUjPdxB9ewtNjMx/h0nLBV01uKP3Pkr5OG5zeoe9RB0gSI2",
  render_errors: [view: DashboardWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Dashboard.PubSub,
  live_view: [signing_salt: "UcItOVwD"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

config :dashboard, :client_url, "http://localhost:3000"

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
