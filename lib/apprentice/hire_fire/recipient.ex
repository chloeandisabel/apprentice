defmodule Apprentice.HireFire.Recipient do
  @moduledoc """
  HireFire Recipient.
  """

  use Napper.Resource

  @derive [Poison.Encoder]

  defstruct id: "",
            application_id: "",
            email: "",
            created_at: nil,
            updated_at: nil

  @type t :: %__MODULE__{
          id: String.t(),
          application_id: String.t(),
          email: String.t(),
          created_at: String.t(),
          updated_at: String.t()
        }
end

defimpl Napper.Endpoint, for: Apprentice.HireFire.Recipient do
  def under_master_resource?(_), do: false
  def endpoint_url(_), do: "/recipients"
end
