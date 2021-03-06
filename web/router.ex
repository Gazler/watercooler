defmodule Watercooler.Router do
  use Watercooler.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Watercooler do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    get "/lobby", LobbyController, :index
    post "/login", AuthController, :create
    get "/logout", AuthController, :delete
    delete "/logout", AuthController, :delete
  end

  # Other scopes may use custom stacks.
  # scope "/api", Watercooler do
  #   pipe_through :api
  # end
end
