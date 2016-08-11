defmodule Sample.UserController do
  use Sample.Web, :controller

  alias Sample.User

  def index(conn, _params) do
    users = Repo.all(Sample.User)
    render conn, "index.html", users: users
    # case authenticate(conn) do
    #   %Plug.Conn{halted: true} = conn ->
    #     conn
    #   conn ->
    #     users = Repo.all(Sample.User)
    #     render conn, "index.html", users: users
    # end
  end

  def show(conn, %{"id" => id}) do
    user = Repo.get(Sample.User, id)
    render conn, "show.html", user: user
  end

  def new(conn, _params) do
    changeset = User.changeset(%User{})
    render conn, "new.html", changeset: changeset
  end

  def create(conn, %{"user" => user_params}) do
    changeset = User.changeset(%User{}, user_params)
    case Repo.insert(changeset) do
      {:ok, user} ->
        conn
        |> put_flash(:info, "#{user.name} created!")
        |> redirect(to: user_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  # defp authenticate(conn) do
  #   if conn.assigns.current_user do
  #     conn
  #   else
  #     conn
  #     |> put_flash(:error, "you must be logged in to access that page")
  #     |> redirect(to: dashboard_path(conn, :homepage)
  #     |> halt()
  #   end
  # end
end
