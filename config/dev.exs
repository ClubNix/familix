use Mix.Config

# For development, we disable any cache and enable
# debugging and code reloading.
#
# The watchers configuration can be used to run external
# watchers to your application. For example, we use it
# with brunch.io to recompile .js and .css sources.
config :familix, Familix.Endpoint,
  http: [port: 4000],
  debug_errors: true,
  code_reloader: true,
  check_origin: false,
  watchers: [node: ["node_modules/brunch/bin/brunch", "watch", "--stdin",
                    cd: Path.expand("../", __DIR__)]]


# Watch static and templates for browser reloading.
config :familix, Familix.Endpoint,
  live_reload: [
    patterns: [
      ~r{priv/static/.*(js|css|png|jpeg|jpg|gif|svg)$},
      ~r{priv/gettext/.*(po)$},
      ~r{web/views/.*(ex)$},
      ~r{web/templates/.*(eex)$}
    ]
  ]

# Do not include metadata nor timestamps in development logs
config :logger, :console, format: "[$level] $message\n"

# Set a higher stacktrace during development. Avoid configuring such
# in production as building large stacktraces may be expensive.
config :phoenix, :stacktrace_depth, 20

# Configure your database
config :familix, Familix.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "familix_dev",
  hostname: "localhost",
  pool_size: 10

config :guardian, Guardian,
  secret_key: %{
    "crv" => "P-521",
    "d" => "AcuOkrPXE5PpGOfofb1bwsbbOgrFtsYyG0NaPAHiqAgjI06vokceFt1Ck3ghXZV8qpSIOMKtuCOgcgtUoZUfq3fw",
    "kty" => "EC",
    "x" => "AcAmXPUgfxbfjf7OiE4sp4orC0_WPRisOtY6mTOU2X_9YSnceAu44JI8qW44L5hYVUPeMLqLBchPINUK4yNXHD_b",
    "y" => "AWhJg6QTABbyRzw2UB1Rn5qZn3m-7xb9aMle7EqWWnFIyeFmd7weaS9IL9mx5Yaau2pWKJ6DWpPHJ-PNqXxZXMno"
  }

config :paddle, Paddle,
  host: "localhost",
  base: "dc=test,dc=com",
  account_subdn: "ou=People",
  ssl: false,
  port: 3389

