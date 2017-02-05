use Mix.Config

# Napper REST API client configuration
config :napper,
  url: "https://api.heroku.com",
  auth: "Bearer #{System.get_env("HEROKU_API_KEY")}",
  accept: "application/vnd.heroku+json; version=3",
  master_prefix: "/apps"
