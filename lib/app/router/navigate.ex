defmodule App.Router.Navigate do
  @derive Jason.Encoder
  @enforce_keys [:to]

  defstruct to: "home"

  @type t :: %__MODULE__{
          to: String.t()
        }
end
