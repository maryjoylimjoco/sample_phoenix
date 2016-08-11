defmodule Sample.Router do
  use Phoenix.Router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug Sample.Auth, repo: Sample.Repo
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Sample do
    pipe_through :browser # Use the default browser stack

    get "/", DashboardController, :homepage
    resources "users", UserController
    resources "dashboards", DashboardController
    resources "pages", PageController
  end

  # Other scopes may use custom stacks.
  # scope "/api", Sample do
  #   pipe_through :api
  # end
end
