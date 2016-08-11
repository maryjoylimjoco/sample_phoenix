defmodule Sample.DashboardController do
  use Sample.Web, :controller

  def homepage(conn, _params) do
    render conn, "homepage.html"
  end
end
