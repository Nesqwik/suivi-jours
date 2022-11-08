defmodule App.Widgets.Main do
  use Widgets

  alias App.Widgets

  @name "main"
  def main(_data, _props, _context) do
    %{
      "children" => [
        Widgets.Menu.new_menu(),
        Widgets.Router.new_router(coll: App.Router.coll(), query: App.Router.current_page_query())
      ],
      "crossAxisAlignment" => "center",
      "direction" => "vertical",
      "scroll" => true,
      "spacing" => 32,
      "type" => "flex"
    }
  end
end
