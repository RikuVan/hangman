# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# Configures the endpoint
config :gallows, Gallows.Web.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "SY5blU+8b6aolHkghQnhpUKS87cgzeOJf4cXQOA1J1syFU9aSGo4jDMl3w2Ar+xq",
  render_errors: [view: Gallows.Web.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Gallows.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"