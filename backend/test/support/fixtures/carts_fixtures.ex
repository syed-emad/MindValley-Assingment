defmodule ShoppingCart.CartsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `ShoppingCart.Carts` context.
  """

  @doc """
  Generate a cart.
  """
  def cart_fixture(attrs \\ %{}) do
    {:ok, cart} =
      attrs
      |> Enum.into(%{
        totalAmount: "120.5",
        userEmail: "some userEmail"
      })
      |> ShoppingCart.Carts.create_cart()

    cart
  end
end
