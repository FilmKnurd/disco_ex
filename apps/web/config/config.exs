# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

# config :web,
#   ecto_repos: [Web.Repo]

# Configures the endpoint
config :web, WebWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "r9xKpMeOwFWvJCrkaPSGyQoWyk7SOD7Fahb+66UoM4WTidRwkIachF8VVckZY+fz",
  render_errors: [view: WebWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Web.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason
config :phoenix, template_engines: [leex: Phoenix.LiveView.Engine]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"

config :web, WebWeb.Endpoint,
  http: [port: 4000],
  live_view: [
    signing_salt: "7jWlYAfk3T0jdVXveXZmH0dRbcPw2R6+1QrEVxbaujgHDrIqcrHn0+71GlO2dxri"
  ],
  debug_errors: true,
  code_reloader: true,
  check_origin: false,
  watchers: [
    node: [
      "node_modules/webpack/bin/webpack.js",
      "--mode",
      "development",
      "--watch-stdin",
      cd: Path.expand("../assets", __DIR__)
    ]
  ]
