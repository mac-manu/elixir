# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :uploaderS3,
  ecto_repos: [UploaderS3.Repo]

# Configures the endpoint
config :uploaderS3, UploaderS3Web.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "P4FsbzC+e6TsPaQ1V2Y7SPdMy4AzG5R4AsDm2RxAXLgyLyJfID4r7+6Lhei8UyKk",
  render_errors: [view: UploaderS3Web.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: UploaderS3.PubSub,
  live_view: [signing_salt: "rI29WmbR"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
