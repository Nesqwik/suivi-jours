defmodule App.Worked.WorkedEntry do
  @derive Jason.Encoder
  @enforce_keys [:date, :duration]

  defstruct date: 0,
            created_at: Timex.now(),
            user: "@me",
            duration: nil,
            _id: nil

  @type t :: %__MODULE__{
          date: DateTime.t(),
          created_at: DateTime.t(),
          user: String.t(),
          duration: float(),
          _id: String.t() | nil
        }
end
