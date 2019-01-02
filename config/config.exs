# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :gibs,
  ecto_repos: [Gibs.Repo]

# Configures the endpoint
config :gibs, GibsWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base:
    System.get_env("SECRET_KEY_BASE") ||
      "O4CFvDf/9yylAsysqpAC6pt89dy1XbbXX6eI5ti4Xk1ezokFiDyyfENqL4X0Lhk9",
  render_errors: [view: GibsWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Gibs.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

config :gibs, :pow,
  user: Gibs.Users.User,
  repo: Gibs.Repo,
  extensions: [PowResetPassword, PowEmailConfirmation],
  controller_callbacks: Pow.Extension.Phoenix.ControllerCallbacks

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
