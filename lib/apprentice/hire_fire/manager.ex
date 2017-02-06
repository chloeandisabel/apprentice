defmodule Apprentice.HireFire.Manager do
  @moduledoc """
  HireFire Manager.
  """

  use Napper.Resource

  @derive [Poison.Encoder]

  # The updatable fields common to all manager types.
  @basic_updatable_fields [
    :name, :type, :enabled, :minimum, :maximum, :notify, :notify_quantity, :notify_after
  ]

  # A map from manager type to updatable field.
  @updatable_fields %{
    "Manager::Web::HireFire::ResponseTime" => @basic_updatable_fields ++ [
      :url, :scale_up_on_503,
      :minimum_response_time, :maximum_response_time,
      :upscale_quantity, :upscale_sensitivity, :upscale_timeout,
      :downscale_quantity, :downscale_sensitivity, :downscale_timeout
    ],
    "Manager::Worker::HireFire::JobQueue" => @basic_updatable_fields ++ [
      :decrementable,
      :ratio
    ],
    "Manager::Web::Logplex::Load" => @basic_updatable_fields ++ [
      :minimum_load, :maximum_load
    ],
    "Manager::Web::Logplex::ResponseTime" => @basic_updatable_fields ++ [
      :minimum_response_time, :maximum_response_time
    ],
    "Manager::Web::Logplex::RPM" => @basic_updatable_fields ++ [
      :ratio
    ],
    "Manager::Web::NewRelic::V1::Apdex" => @basic_updatable_fields ++ [
      :minimum_apdex, :maximum_apdex,
      :new_relic_account_id, :new_relic_api_key, :new_relic_app_id,
      :upscale_quantity, :upscale_sensitivity, :upscale_timeout,
      :downscale_quantity, :downscale_sensitivity, :downscale_timeout
    ],
    "Manager::Web::NewRelic::V1::ResponseTime" => @basic_updatable_fields ++ [
      :url, :scale_up_on_503,
      :minimum_response_time, :maximum_response_time,
      :new_relic_account_id, :new_relic_api_key, :new_relic_app_id,
      :upscale_quantity, :upscale_sensitivity, :upscale_timeout,
      :downscale_quantity, :downscale_sensitivity, :downscale_timeout
    ],
    "Manager::Web::NewRelic::V1::RPM" => @basic_updatable_fields ++ [
      :ratio,
      :new_relic_account_id, :new_relic_api_key, :new_relic_app_id
    ],
    "Manager::Web::NewRelic::V2::Apdex" => @basic_updatable_fields ++ [
      :minimum_apdex, :maximum_apdex,
      :new_relic_account_id, :new_relic_api_key, :new_relic_app_id,
      :upscale_quantity, :upscale_sensitivity, :upscale_timeout,
      :downscale_quantity, :downscale_sensitivity, :downscale_timeout
    ],
    "Manager::Web::NewRelic::V2::ResponseTime" => @basic_updatable_fields ++ [
      :url, :scale_up_on_503,
      :minimum_response_time, :maximum_response_time,
      :new_relic_account_id, :new_relic_api_key, :new_relic_app_id,
      :upscale_quantity, :upscale_sensitivity, :upscale_timeout,
      :downscale_quantity, :downscale_sensitivity, :downscale_timeout
    ],
    "Manager::Web::NewRelic::V2::RPM" => @basic_updatable_fields ++ [
      :ratio,
      :new_relic_account_id, :new_relic_api_key, :new_relic_app_id
    ],
  }

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

  @doc "Map all legal manager types to their updatable fields."
  def updatable_fields, do: @updatable_fields

  @doc "The list of all legal manager types."
  def types, do: Map.keys(@updatable_fields)

  @doc """
  Returns a new map containing the updatable parameters for `manager`'s
  type.
  """
  def updatable(%__MODULE__{type: type} = manager) do
    Map.take(manager, @updatable_fields[type])
  end

end

defimpl Napper.Endpoint, for: Apprentice.HireFire.Manager do
  def under_master_resource?(_), do: false
  def endpoint_url(_), do: "/managers"
end
