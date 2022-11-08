defmodule App.Listeners.RouterListener do
  use Listeners

  alias App.Router.Navigate

  @action "navigate"
  @props_struct Navigate
  def navigate(%Navigate{} = props, _event, api) do
    App.Router.set_page(api, props.to)
  end
end
