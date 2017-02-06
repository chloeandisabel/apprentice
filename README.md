# Apprentice

Apprentice is a collection of Elixir structs for
the [HireFire API](http://docs.hirefire.io/) useable by
the [Napper](https://github.com/chloeandisabel/napper) JSON REST API
application.

Apprentice defines structs for all of the resources exposed by HireFire's API.

## Installation

First, add Apprentice to your `mix.exs` dependencies:

```elixir
def deps do
  [{:apprentice, git: "https://github.com/chloeandisabel/apprentice.git"}]
end
```

and run `$ mix deps.get`. Now, list the `:apprentice` application as your
application dependency:

```elixir
def applications do
  [applications: [:apprentice]]
end
```

## Configuration

We need to tell Napper about HireFire's API.

```elixir
config :napper,
  url: "https://api.hirefire.io",
  auth: "Token #{System.get_env("HIREFIRE_API_KEY")}",
  accept: "application/vnd.hirefire.v1+json",
  remove_wrapper: true
```

That last entry tells Napper to remove the outer wrapper from HireFire
responses. When asking for a list of organizations, HireFire returns

```json
{"organizations": [...]}
```

but Napper expects that innter array of objects. Setting `remove_wrapper` to
`true` tells Napper to strip off the outer "organizations" object, returning
only the array.

## Using Apprentice

Let's try out Apprentice from within IEX.

```sh
$ iex -S mix
```

First we create a client using Napper. This example assumes we've used our
config file to configure Napper properly.

```elixir
iex> client = Napper.api_client
```

What organizations do we have?

```elixir
iex> client |> Apprentice.HireFire.Organization.list
#=> [%Apprentice.HireFire.Organization{...}]
```
