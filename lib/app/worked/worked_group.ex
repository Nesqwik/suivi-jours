defmodule App.Worked.WorkedGroup do
  @derive Jason.Encoder
  @enforce_keys [:month, :nb_working_hours, :remaining_hours]

  defstruct month: nil,
            total_duration: 0,
            entries: [],
            nb_working_hours: 0,
            remaining_hours: 0

  @type t :: %__MODULE__{
          month: DateTime.t(),
          total_duration: integer(),
          entries: list(App.Worked.WorkedEntry.t()),
          nb_working_hours: integer(),
          remaining_hours: float()
        }
end
