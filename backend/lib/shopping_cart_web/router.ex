defmodule ShoppingCartWeb.Router do
  use ShoppingCartWeb, :router

  pipeline :api do
    plug CORSPlug, origin: "*"
    plug :accepts, ["json"]
  end


  scope "/api", ShoppingCartWeb do
    pipe_through :api
    get "/products", ProductController, :index
    get "/product/:id", ProductController, :show
    post "/products", ProductController, :create
    post "/order",OrderController,:create
  end
end
