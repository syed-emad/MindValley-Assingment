defmodule ShoppingCartWeb.OrderController do
  use ShoppingCartWeb, :controller

  alias ShoppingCart.Orders
  alias ShoppingCart.Products
  alias ShoppingCart.Carts
  alias ShoppingCart.Carts.Cart
  action_fallback ShoppingCartWeb.FallbackController

  def index(conn, _params) do
    orders = Orders.list_orders()
    render(conn, :index, orders: orders)
  end

  def create(conn, %{"order" => order_params}) do
    items = order_params["items"]
    # IO.inspect(items, label: "Items")
    Enum.each(items,fn product ->
      Products.order_product2(product["product_id"],product["orderQuantity"])
    end)
    userEmail = order_params["userEmail"]
    totalAmount = order_params["orderAmount"]
    cart_params = %{
      userEmail: userEmail,
      totalAmount: totalAmount
    }
   {:ok, %Cart{id: cart_id}} = Carts.create_cart(cart_params)
   IO.inspect(cart_id, label: "Created Cart ID")
    Enum.each(items,fn product->
      order_params=%{
        quantity: product["orderQuantity"],
        price: product["price"],
        product_id: product["product_id"],
        total_price: product["price"] * product["orderQuantity"],
        cart_id: cart_id
      }
       Orders.create_order(order_params)
    end)
        response_payload = %{
          message: "Order created successfully",
          cart_id: cart_id,
          total_items: Enum.count(items)
        }

        conn
        |> put_status(:created)
        |> json(response_payload)

    #  userEmail: "",
    #     orderAmount: 1212,
    #     items: [{ orderQuantity, product_id: 1 }],
    # product_id = order_params["product_id"]
    # product = Products.get_product!(product_id)
    # with {:ok, _}<- Products.order_product(product),
    #      {:ok, %Order{} = order} <- Orders.create_order(order_params) do
    #   conn
    #   |> put_status(:created)
    #   |> put_resp_header("location", ~p"/api/order")
    #   |> render(:show, order: order)
    # end
    orders = Orders.list_orders()
    render(conn, :index, orders: orders)
  end

  def show(conn, %{"id" => id}) do
    order = Orders.get_order!(id)
    render(conn, :show, order: order)
  end


end
