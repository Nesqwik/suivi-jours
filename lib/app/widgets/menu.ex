defmodule App.Widgets.Menu do
  use Widgets

  alias App.Router.Navigate

  @name "menu"
  def menu_w(_data, _props, _context) do
    %{
      "child" => %{
        "children" => [
          %{
            "child" => %{"src" => "logo.png", "type" => "image"},
            "constraints" => %{
              "maxHeight" => 32,
              "maxWidth" => 32,
              "minHeight" => 32,
              "minWidth" => 32
            },
            "type" => "container"
          },
          %{
            "child" => %{
              "child" => %{
                "style" => %{"fontSize" => 24, "fontWeight" => "bold"},
                "textAlign" => "center",
                "type" => "text",
                "value" => "Hello World"
              },
              "type" => "container"
            },
            "type" => "flexible"
          },
          %{
            "type" => "flex",
            "children" => [
              %{
                "type" => "actionable",
                "child" => %{"type" => "icon", "value" => "edit_sharp"},
                "onPressed" =>
                  App.Listeners.RouterListener.new_navigate(
                    props: %Navigate{to: App.Widgets.Worked.page()}
                  )
              },
              %{
                "type" => "actionable",
                "child" => %{"type" => "icon", "value" => "info_sharp"},
                "onPressed" =>
                  App.Listeners.RouterListener.new_navigate(
                    props: %Navigate{to: App.Widgets.Stats.page()}
                  )
              }
            ]
          }
        ],
        "crossAxisAlignment" => "center",
        "fillParent" => true,
        "mainAxisAlignment" => "spaceBetween",
        "padding" => %{"right" => 4},
        "type" => "flex"
      },
      "decoration" => %{
        "boxShadow" => %{
          "blurRadius" => 8,
          "color" => 0x1A000000,
          "offset" => %{"dx" => 0, "dy" => 1}
        },
        "color" => 0xFFFFFFFF
      },
      "padding" => %{"bottom" => 2, "left" => 4, "right" => 4, "top" => 2},
      "type" => "container"
    }
  end
end
