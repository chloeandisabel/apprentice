use Mix.Config

# Napper REST API client configuration
config :napper,
  url: "https://api.example.com",
  auth: "Bearer xyzzy-plugh",
  accept: "application/vnd.heroku+json; version=3",
  master_prefix: "/apps"
