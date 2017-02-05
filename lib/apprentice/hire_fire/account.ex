defmodule Apprentice.HireFire.Account do
  @moduledoc """
  HireFire Account.
  """
  
  @derive [Poison.Encoder]
  
  defstruct id: "",
    organization_id: "",
    email: "",
    remaining_api_calls: 0,
    created_at: nil,
    updated_at: nil

  @type t :: %__MODULE__ {
    id: String.t,
    organization_id: String.t,
    email: String.t,
    remaining_api_calls: integer,
    created_at: String.t,
    updated_at: String.t
  }
end

defimpl Napper.Endpoint, for: Apprentice.HireFire.Account do
  def under_master_resource?(_), do: false
  def endpoint_url(_), do: "/accounts"
end
