defmodule Sample.UserController do
  use Sample.Web, :controller

  def show(conn, %{"id" => id}) do
    user = Repo.get(Sample.User, id)
    render conn, "show.html", user: user
  end
end
