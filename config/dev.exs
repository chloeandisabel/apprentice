use Mix.Config

# Napper REST API client configuration
config :napper,
  url: "https://api.hirefire.io",
  auth: "Token #{System.get_env("HIREFIRE_API_KEY")}",
  accept: "application/vnd.hirefire.v1+json",
  remove_wrapper: true
