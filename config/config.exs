# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

# Configures the endpoint
config :hayago, HayagoWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "qIFgTGVPpu8QBRiqb0/yNrZxRu8/SlqabAl8Nl+XE4e+aPSts9OXp4K9SbfAnjXB",
  render_errors: [view: HayagoWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Hayago.PubSub, adapter: Phoenix.PubSub.PG2],
  live_view: [signing_salt: "iyLSikcywGUPaYmw2i6VF8nXdpnwu0/9"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
