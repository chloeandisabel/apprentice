use Mix.Config

# Napper REST API client configuration
config :napper,
  url: "https://api.example.com",
  auth: "Token xyzzy-plugh",
  accept: "application/vnd.hirefire.v1+json",
  remove_wrapper: true
