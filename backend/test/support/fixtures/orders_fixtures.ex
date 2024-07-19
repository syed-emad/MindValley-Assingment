defmodule ShoppingCart.OrdersFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `ShoppingCart.Orders` context.
  """

  @doc """
  Generate a order.
  """
  def order_fixture(attrs \\ %{}) do
    {:ok, order} =
      attrs
      |> Enum.into(%{
        price: "120.5",
        quantity: 42,
        total_price: "120.5"
      })
      |> ShoppingCart.Orders.create_order()

    order
  end
end
