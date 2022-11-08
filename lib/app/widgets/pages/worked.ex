defmodule App.Widgets.Worked do
  use Widgets

  alias App.Worked.WorkedEntry

  @page "worked"
  def page do
    @page
  end

  @name "worked"
  @data_struct WorkedEntry
  def home_w(entries, _props, _context) do
    %{
      "type" => "flex",
      "direction" => "vertical",
      "children" => [
        form(),
        entries |> App.Worked.normalize_entries() |> build_list()
      ]
    }
  end

  defp form do
    %{
      "type" => "form",
      "onSubmit" => App.Listeners.WorkerEntryListeners.new_add_worker_entry(),
      "child" => %{
        "type" => "flex",
        "direction" => "vertical",
        "children" => [
          %{
            "type" => "textfield",
            "name" => "date",
            "value" => Timex.now() |> Timex.format!("{0D}/{0M}/{YYYY}")
          },
          %{
            "type" => "textfield",
            "name" => "duration",
            "value" => "7"
          },
          %{
            "type" => "button",
            "text" => "Validate",
            "submit" => true
          }
        ]
      }
    }
  end

  defp build_list(entries) do
    %{
      "type" => "flex",
      "direction" => "vertical",
      "children" =>
        Enum.map(entries, fn %WorkedEntry{} = e ->
          %{
            "type" => "flex",
            "spacing" => 24,
            "children" => [
              %{"type" => "text", "value" => Timex.format!(e.date, "{0D}/{0M}/{YYYY}")},
              %{"type" => "text", "value" => "#{e.duration}j"},
              %{
                "type" => "actionable",
                "child" => %{"type" => "icon", "value" => "delete_forever"},
                "onPressed" =>
                  App.Listeners.WorkerEntryListeners.new_delete_worker_entry(
                    props: %App.Props.Id{_id: e._id}
                  )
              }
            ]
          }
        end)
    }
  end
end
