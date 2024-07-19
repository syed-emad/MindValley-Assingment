defmodule ShoppingCartWeb.Router do
  use ShoppingCartWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", ShoppingCartWeb do
    pipe_through :api
    get "/",DefaultController,:index
    get "/products", ProductController, :index
    post "/products", ProductController, :create
    get "/product/:id", ProductController, :show
    put "/product/:id",ProductController, :update
    put "/product/order/:id", ProductController, :order
  end
end
  #  get "/users", UserController, :index
  #   put "/users", UserController, :edit
  #   post "/users", UserController, :create
    # delete "/users", UserController, :delete
