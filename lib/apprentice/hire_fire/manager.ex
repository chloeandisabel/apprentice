defmodule Apprentice.HireFire.Manager do
  @moduledoc """
  HireFire Manager.
  """

  use Napper.Resource

  @derive [Poison.Encoder]

  defstruct id: "",
    type: "",
    application_id: "",
    name: "",
    enabled: false,
    metric_value: "",
    dyno_quantity: 0,
    last_checkup_time: "",
    last_scale_time: "",
    minimum: 0,
    maximum: 0,
    notify: false,
    notify_quantity: 0,
    notify_after: 0,
    created_at: "",
    updated_at: "",
    ratio: 0,
    decrementable: false,
    issue: ""

  @type t :: %__MODULE__ {
    id: String.t,
    type: String.t,
    application_id: String.t,
    name: String.t,
    enabled: false,
    metric_value: String.t,
    dyno_quantity: integer,
    last_checkup_time: String.t,
    last_scale_time: String.t,
    minimum: integer,
    maximum: integer,
    notify: boolean,
    notify_quantity: integer,
    notify_after: integer,
    created_at: String.t,
    updated_at: String.t,
    ratio: integer,
    decrementable: boolean,
    issue: String.t
  }
end

defimpl Napper.Endpoint, for: Apprentice.HireFire.Manager do
  def under_master_resource?(_), do: false
  def endpoint_url(_), do: "/managers"
end
