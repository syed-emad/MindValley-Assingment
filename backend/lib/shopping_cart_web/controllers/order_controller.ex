defmodule ShoppingCartWeb.OrderController do
  use ShoppingCartWeb, :controller

  alias ShoppingCart.Orders
  alias ShoppingCart.Orders.Order
  alias ShoppingCart.Products
  action_fallback ShoppingCartWeb.FallbackController

  def index(conn, _params) do
    orders = Orders.list_orders()
    render(conn, :index, orders: orders)
  end

  def create(conn, %{"order" => order_params}) do
    IO.inspect(order_params, label: "Order Params")
    product_id = order_params["product_id"]
    product = Products.get_product!(product_id)
      IO.inspect(label: "DONE")
    with {:ok, _}<- Products.order_product(product),
         {:ok, %Order{} = order} <- Orders.create_order(order_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", ~p"/api/order")
      |> render(:show, order: order)
    end
  end

  def show(conn, %{"id" => id}) do
    order = Orders.get_order!(id)
    render(conn, :show, order: order)
  end


end
