defmodule Apprentice.HireFire.Organization do
  @moduledoc """
  HireFire Organization.
  """
  
  @derive [Poison.Encoder]
  
  defstruct id: "",
    name: "",
    time_zone: "",
    manager_hours: 0,
    hourly_rate: 0,
    trial_ends_at: "",
    created_at: "",
    updated_at: ""

  @type t :: %__MODULE__ {
    id: String.t,
    name: String.t,
    time_zone: String.t,
    manager_hours: integer,
    hourly_rate: float,
    trial_ends_at: String.t,
    created_at: String.t,
    updated_at: String.t
  }
end

defimpl Napper.Endpoint, for: Apprentice.HireFire.Organization do
  def under_master_resource?(_), do: false
  def endpoint_url(_), do: "/organizations"
end
