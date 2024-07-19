defmodule ShoppingCartWeb.OrderJSON do
  alias ShoppingCart.Orders.Order

  @doc """
  Renders a list of orders.
  """
  def index(%{orders: orders}) do
    %{data: for(order <- orders, do: data(order))}
  end

  @doc """
  Renders a single order.
  """
  def show(%{order: order}) do
    %{data: data(order)}
  end

  defp data(%Order{} = order) do
    %{
      id: order.id,
      quantity: order.quantity,
      price: order.price,
      total_price: order.total_price
    }
  end
end
