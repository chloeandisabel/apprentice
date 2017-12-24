defmodule Apprentice.HireFire.ChartState do
  @moduledoc """
  HireFire ChartState.
  """

  use Napper.Resource, only: [:list]

  @derive [Poison.Encoder]

  defstruct id: "",
            manager_id: "",
            average: 0.0,
            date_hour: 0

  @type t :: %__MODULE__{
          id: String.t(),
          manager_id: String.t(),
          average: float,
          date_hour: integer
        }
end

defimpl Napper.Endpoint, for: Apprentice.HireFire.ChartState do
  def under_master_resource?(_), do: false
  def endpoint_url(_), do: "/chart_states"
end
