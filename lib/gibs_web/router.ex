defmodule GibsWeb.Router do
  use GibsWeb, :router
  use Pow.Phoenix.Router
  use Pow.Extension.Phoenix.Router, otp_app: :gibs

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :protected do
    plug Pow.Plug.RequireAuthenticated,
      error_handler: Pow.Phoenix.PlugErrorHandler
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/" do
    pipe_through :browser
    pow_routes()
    pow_extension_routes()
  end

  scope "/", GibsWeb do
    pipe_through :browser

    get "/", PageController, :index
  end

  scope "/", GibsWeb do
    pipe_through [:browser, :protected]

    get "/dashboard", PageController, :dashboard
  end

  scope "/api/v1", GibsWeb do
     pipe_through :api
  end
end
