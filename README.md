# Apprentice

Apprentice is a collection of Elixir structs for
the [HireFire API](http://docs.hirefire.io/) useable by
the [Napper](https://github.com/chloeandisabel/napper) JSON REST API
application.

Apprentice defines structs for all of the resources exposed by HireFire's API.

## Installation

The package can be installed by adding Apprentice to your list of dependencies
in `mix.exs`. You'll also need Napper.

```elixir
def deps do
  [{:apprentice, git: "https://github.com/chloeandisabel/apprentice.git"},
   {:napper, git: "https://github.com/chloeandisabel/napper.git"}]
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
iex -S mix
```

First we need to start HTTPoison (Napper needs this; see the Napper docs).

```elixir
iex> HTTPoison.start
```

Now we can create a client using Napper. This example assumes we've used our
config file to configure Napper properly.

```elixir
iex> client = Napper.api_client
```

What organizations do we have?

```elixir
iex> client |> Apprentice.HireFire.Organization.list
#=> [%Apprentice.HireFire.Organization{...}]
```
