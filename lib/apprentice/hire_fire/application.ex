defmodule Apprentice.HireFire.Application do
  @moduledoc """
  HireFire Application.
  """

  use Napper.Resource

  @derive [Poison.Encoder]

  defstruct id: "",
    account_id: "",
    name: "",
    custom_domain: "",
    token: "",
    logplex_drain_token: "",
    ssl: false,
    restart_crashed_dynos: false,
    new_issue_notifications: false,
    resolved_issue_notifications: false,
    created_at: "",
    updated_at: "",
    issue: ""

  @type t :: %__MODULE__ {
    id: String.t,
    account_id: String.t,
    name: String.t,
    custom_domain: String.t,
    token: String.t,
    logplex_drain_token: String.t,
    ssl: boolean,
    restart_crashed_dynos: boolean,
    new_issue_notifications: boolean,
    resolved_issue_notifications: boolean,
    created_at: String.t,
    updated_at: String.t,
    issue: String.t
  }
end

defimpl Napper.Endpoint, for: Apprentice.HireFire.Application do
  def under_master_resource?(_), do: false
  def endpoint_url(_), do: "/applications"
end
