defmodule Familix.Router do
  use Familix.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers,
      %{"Content-Security-Policy"
       => ~S(
          default-src 'none';
          script-src 'self';
          connect-src 'self';
          img-src 'self';
          font-src 'self';
          style-src 'self';
        )}
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Familix do
    pipe_through :browser # Use the default browser stack

    get "/about", PageController, :index
  end

  # Other scopes may use custom stacks.
  # scope "/api", Familix do
  #   pipe_through :api
  # end
end
