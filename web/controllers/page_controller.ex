defmodule Sample.PageController do
  use Sample.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
