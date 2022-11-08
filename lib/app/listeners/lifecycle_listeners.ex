defmodule App.Listeners.LifecycleListeners do
  use Listeners

  @action "onEnvStart"
  def on_env_start(_props, _event, _api) do
    :ok
  end

  @action "onUserFirstJoin"
  def on_user_first_join(_props, _event, _api) do
    :ok
  end

  @action "onSessionStart"
  def on_session_start(_props, _event, api) do
    App.Router.set_page(api, App.Widgets.Worked.page())
  end
end
