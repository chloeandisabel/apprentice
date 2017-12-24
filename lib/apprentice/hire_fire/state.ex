defmodule Apprentice.HireFire.State do
  @moduledoc """
  HireFire State.
  """

  use Napper.Resource, only: [:list]

  @derive [Poison.Encoder]

  defstruct id: "",
            manager_id: "",
            metric_value: nil,
            dyno_quantity: 0,
            created_at: nil

  @type t :: %__MODULE__{
          id: String.t(),
          manager_id: String.t(),
          metric_value: String.t(),
          dyno_quantity: integer,
          created_at: String.t()
        }
end

defimpl Napper.Endpoint, for: Apprentice.HireFire.State do
  def under_master_resource?(_), do: false
  def endpoint_url(_), do: "/states"
end
