defmodule KualiChatWeb.Router do
  use KualiChatWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug Phoenix.LiveView.Flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", KualiChatWeb do
    pipe_through :browser

    # get "/", PageController, :index
    live "/", ChatLive
  end

  # Other scopes may use custom stacks.
  # scope "/api", KualiChatWeb do
  #   pipe_through :api
  # end
end
