defmodule ShoppingCartWeb.OrderController do
  use ShoppingCartWeb, :controller

  alias ShoppingCart.Orders
  alias ShoppingCart.Products
  alias ShoppingCart.Carts
  alias ShoppingCart.Carts.Cart
  action_fallback ShoppingCartWeb.FallbackController
  def create(conn, %{"order" => order_params}) do
    items = order_params["items"]
    # IO.inspect(items, label: "Items")
    Enum.each(items,fn product ->
      Products.order_product(product["product_id"],product["orderQuantity"])
    end)
    userEmail = order_params["userEmail"]
    totalAmount = order_params["orderAmount"]
    address = order_params["address"]
    name = order_params["name"]
    city = order_params["city"]
    country = order_params["country"]
    cart_params = %{
      userEmail: userEmail,
      totalAmount: totalAmount,
      name: name,
      country: country,
      city: city,
      address: address
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
    orders = Orders.list_orders()
    render(conn, :index, orders: orders)
  end
end
