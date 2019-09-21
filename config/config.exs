# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

# Configures the endpoint
config :kuali_chat, KualiChatWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "9Ybm80jXj3s21wKdmOP77aotthxPDnMPGpKzTQd3VoB0nZOHPzFO5C08DWb02O9A",
  render_errors: [view: KualiChatWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: KualiChat.PubSub, adapter: Phoenix.PubSub.PG2],
  live_view: [
    signing_salt: "AB0O9DRIaFx84WKK+0UIU8n1o8E4FMvP"
  ]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
