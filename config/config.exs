# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :familix,
  ecto_repos: [Familix.Repo]

# Configures the endpoint
config :familix, Familix.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "joJkdTBrdeK1FHi2OtAYWBWZP/t8iOiXxHGr1dR+CXcd0Imc8NsN31uOaFS7WU5u",
  render_errors: [view: Familix.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Familix.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :guardian, Guardian,
  issuer: "Familix",
  ttl: { 30, :days },
  allowed_drift: 2000,
  verify_issuer: true, # optional
  serializer: Familix.GuardianSerializer

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
