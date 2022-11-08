defmodule App.Listeners.WorkerEntryListeners do
  use Listeners

  alias App.Worked

  @action "add_worker_entry"
  def add_worker_entry(_props, %{"value" => entry}, api) do
    duration_str = Map.get(entry, "duration")
    date_str = Map.get(entry, "date")

    with {:ok, date} <- Timex.parse(date_str, "{0D}/{0M}/{YYYY}"),
         {duration, _rest} <- Float.parse(duration_str) do
      Worked.add_entry(api, date, duration)
    end
  end

  @action "delete_worker_entry"
  @props_struct App.Props.Id
  def delete_worker_entry(%App.Props.Id{_id: id}, _event, api) do
    Worked.remove_entry(api, id)
  end
end
