defmodule App.Router do
  alias App.Router.Page

  @coll "pages"

  def coll do
    @coll
  end

  def set_page(api, name) do
    case Api.DataApi.execute_query(api, @coll, current_page_query(), as: Page) do
      {:ok, [%Page{} = doc]} ->
        doc = Map.put(doc, :name, name)
        Api.DataApi.update_doc(api, @coll, doc)

      _err ->
        Api.DataApi.create_doc(api, @coll, %Page{name: name})
    end
  end

  def current_page_query do
    %{"user" => "@me"}
  end
end
