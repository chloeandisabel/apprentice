defmodule Apprentice.HireFire.Manager do
  @moduledoc """
  HireFire Manager.
  """

  use Napper.Resource

  @derive [Poison.Encoder]

  @types [
    "Manager::Web::HireFire::ResponseTime",
    "Manager::Worker::HireFire::JobQueue",
    "Manager::Web::Logplex::Load",
    "Manager::Web::Logplex::ResponseTime",
    "Manager::Web::Logplex::RPM",
    "Manager::Web::NewRelic::V1::Apdex",
    "Manager::Web::NewRelic::V1::ResponseTime",
    "Manager::Web::NewRelic::V1::RPM",
    "Manager::Web::NewRelic::V2::Apdex",
    "Manager::Web::NewRelic::V2::ResponseTime",
    "Manager::Web::NewRelic::V2::RPM"
  ]

  defmodule Issue do
    defstruct [:id, :parent_id, :parent_type, :operation, :response, :message]
    @type t :: %__MODULE__ {
      id: String.t,
      parent_id: String.t,
      parent_type: String.t,
      operation: String.t,
      response: String.t,
      message: String.t
    }
  end

  defstruct id: "",
    application_id: "",
    name: "",
    type: "",
    enabled: false,
    minimum: 0,
    maximum: 0,
    notify: false,
    notify_quantity: 0,
    notify_after: 0,
    decrementable: false,
    downscale_quantity: 0,
    downscale_sensitivity: 0,
    downscale_timeout: 0,
    dyno_quantity: 0,
    issue: nil,
    last_checkup_time: "",
    last_scale_time: "",
    maximum_apdex: 0,
    maximum_load: 0,
    maximum_response_time: 0,
    metric_value: "",
    minimum_apdex: 0,
    minimum_load: 0,
    minimum_response_time: 0,
    new_relic_account_id: "",
    new_relic_api_key: "",
    new_relic_app_id: "",
    ratio: 0,
    scale_up_on_503: false,
    upscale_quantity: 0,
    upscale_sensitivity: 0,
    upscale_timeout: 0,
    url: "",
    created_at: "",
    updated_at: ""

  @type t :: %__MODULE__ {
    id: String.t,
    application_id: String.t,
    name: String.t,
    type: String.t,
    enabled: boolean,
    minimum: integer,
    maximum: integer,
    notify: boolean,
    notify_quantity: integer,
    notify_after: integer,
    decrementable: boolean,
    downscale_quantity: integer,
    downscale_sensitivity: integer,
    downscale_timeout: integer,
    dyno_quantity: integer,
    issue: Issue.t,
    last_checkup_time: String.t,
    last_scale_time: String.t,
    maximum_apdex: integer,
    maximum_load: integer,
    maximum_response_time: integer,
    metric_value: String.t,
    minimum_apdex: integer,
    minimum_load: integer,
    minimum_response_time: integer,
    new_relic_account_id: String.t,
    new_relic_api_key: String.t,
    new_relic_app_id: String.t,
    ratio: integer,
    scale_up_on_503: boolean,
    upscale_quantity: integer,
    upscale_sensitivity: integer,
    upscale_timeout: integer,
    url: String.t,
    created_at: String.t,
    updated_at: String.t
  }

  @doc "The list of all legal manager types."
  def types, do: @types
end

defimpl Napper.Endpoint, for: Apprentice.HireFire.Manager do
  def under_master_resource?(_), do: false
  def endpoint_url(_), do: "/managers"
end
