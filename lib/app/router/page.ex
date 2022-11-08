defmodule App.Router.Page do
  @derive Jason.Encoder
  @enforce_keys [:name]

  defstruct name: "home",
            user: "@me",
            _id: nil

  @type t :: %__MODULE__{
          name: String.t(),
          user: String.t(),
          _id: String.t() | nil
        }
end
