defmodule Apprentice.HireFire.Membership do
  @moduledoc """
  HireFire Membership.
  """
  
  @derive [Poison.Encoder]
  
  defstruct id: "",
    user_id: "",
    organization_id: "",
    owner: false,
    created_at: nil,
    updated_at: nil

  @type t :: %__MODULE__ {
    id: String.t,
    user_id: String.t,
    organization_id: String.t,
    owner: boolean,
    created_at: String.t,
    updated_at: String.t
  }
end

defimpl Napper.Endpoint, for: Apprentice.HireFire.Membership do
  def under_master_resource?(_), do: false
  def endpoint_url(_), do: "/memberships"
end
