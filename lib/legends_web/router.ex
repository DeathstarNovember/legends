defmodule LegendsWeb.Router do
  use LegendsWeb, :router

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

  scope "/", LegendsWeb do
    pipe_through :browser

    get "/", PageController, :index
  end

  scope "/" do
    pipe_through :api
    forward "/api", Absinthe.Plug, schema: LegendsWeb.Schema
    forward "/graphiql", Absinthe.Plug.GraphiQL, schema: LegendsWeb.Schema
  end


  # Other scopes may use custom stacks.
  # scope "/api", LegendsWeb do
  #   pipe_through :api
  # end
end
