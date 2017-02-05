defmodule Apprentice.HireFire.User do
  @moduledoc """
  HireFire User.
  """
  
  use Napper.Resource
  
  @derive [Poison.Encoder]
  
  defstruct id: "",
    email: "",
    created_at: nil,
    updated_at: nil

  @type t :: %__MODULE__ {
    id: String.t,
    email: String.t,
    created_at: String.t,
    updated_at: String.t
  }
end

defimpl Napper.Endpoint, for: Apprentice.HireFire.User do
  def under_master_resource?(_), do: false
  def endpoint_url(_), do: "/users"
end
