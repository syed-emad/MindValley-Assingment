defmodule ShoppingCartWeb.Router do
  use ShoppingCartWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end


  # def create(conn, %{"order" => order_params}) do
  #   product = Products.get_product!(order_params.product_id)

  #   with {:ok, %Orders.Order{} = order} <- Orders.create_order(order_params),
  #        {:ok, _} <- Products.order_product(product) do
  #     conn
  #     |> put_status(:created)
  #     |> put_resp_header("location", Routes.order_path(conn, :show, order))
  #     |> render(:show, order: order)
  #   end
  # end
  scope "/api", ShoppingCartWeb do
    pipe_through :api
    get "/",DefaultController,:index
    get "/products", ProductController, :index
    get "/product/:id", ProductController, :show
    post "/products", ProductController, :create
    post "/order",OrderController,:create
  end
end
  #  get "/users", UserController, :index
  #   put "/users", UserController, :edit
  #   post "/users", UserController, :create
    # delete "/users", UserController, :delete
