# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :sample,
  ecto_repos: [Sample.Repo]

# Configures the endpoint
config :sample, Sample.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "+5jwU0oXNONrJ4AQR+SOr8DsLXwGTf84g1tJ5Oy7ttt5UOhatLxCHVLpwVW1D2V5",
  render_errors: [view: Sample.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Sample.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
