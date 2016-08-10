defmodule Sample.DashboardController do
  use Sample.Web, :controller

  def homepage(conn, _params) do
    render conn, "homepage.html"
  end

  def index(conn, _params) do
    users = Repo.all(Sample.User)
    render conn, "index.html", users: users
  end
end
