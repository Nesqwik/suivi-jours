defmodule App.Widgets.Router do
  use Widgets

  alias App.Widgets
  alias App.Router.Page

  @name "router"
  @data_struct Page
  def router_w([%Page{} = page], _props, _context) do
    Map.get(pages(), page.name, Widgets.Worked.new_worked())
  end

  defp pages do
    %{
      Widgets.Worked.page() =>
        Widgets.Worked.new_worked(coll: App.Worked.coll(), query: App.Worked.get_mine_query()),
      Widgets.Stats.page() =>
        Widgets.Stats.new_stats(coll: App.Worked.coll(), query: App.Worked.get_mine_query())
    }
  end
end
