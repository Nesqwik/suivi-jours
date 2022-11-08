defmodule App.Widgets.Stats do
  use Widgets

  alias App.Worked.{WorkedEntry, WorkedGroup}
  alias App.Worked

  @page "stats"
  def page do
    @page
  end

  @name "stats"
  @data_struct WorkedEntry
  def stats(entries, _props, _context) do
    entries
    |> App.Worked.normalize_entries()
    |> Worked.compute_entries()
    |> build_widget()
  end

  defp build_widget(groups) do
    %{
      "children" =>
        groups
        |> Enum.map(fn {_k, %WorkedGroup{} = group} ->
          %{
            "type" => "flex",
            "children" => [
              %{"type" => "text", "value" => Timex.format!(group.month, "{Mfull}")},
              %{"type" => "text", "value" => "Due : #{group.nb_working_hours}"},
              %{"type" => "text", "value" => "Done : #{group.total_duration}"},
              %{"type" => "text", "value" => "Total : #{group.remaining_hours}"}
            ]
          }
        end),
      "crossAxisAlignment" => "center",
      "direction" => "vertical",
      "scroll" => true,
      "spacing" => 32,
      "type" => "flex"
    }
  end
end
