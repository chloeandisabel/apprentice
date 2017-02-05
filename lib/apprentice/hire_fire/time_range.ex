defmodule Apprentice.HireFire.TimeRange do
  @moduledoc """
  HireFire TimeRange.
  """
  
  @derive [Poison.Encoder]
  
  defstruct id: "",
    manager_id: "",
    from: 0,
    until: 0,
    minimum: 0,
    maximum: 0,
    position: 0,
    monday: false,
    tuesday: false,
    wednesday: false,
    thursday: false,
    friday: false,
    saturday: false,
    sunday: false

  @type t :: %__MODULE__ {
    id: String.t,
    manager_id: String.t,
    from: integer,
    until: integer,
    minimum: integer,
    maximum: integer,
    position: integer,
    monday: boolean,
    tuesday: boolean,
    wednesday: boolean,
    thursday: boolean,
    friday: boolean,
    saturday: boolean,
    sunday: boolean
  }
end

defimpl Napper.Endpoint, for: Apprentice.HireFire.TimeRange do
  def under_master_resource?(_), do: false
  def endpoint_url(_), do: "/time_ranges"
end
