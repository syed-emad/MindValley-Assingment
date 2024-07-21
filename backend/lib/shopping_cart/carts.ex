defmodule ShoppingCart.Carts do
  @moduledoc """
  The Carts context.
  """

  import Ecto.Query, warn: false
  alias ShoppingCart.Repo

  alias ShoppingCart.Carts.Cart
  @doc """
  Creates a cart.

  ## Examples

      iex> create_cart(%{field: value})
      {:ok, %Cart{}}

      iex> create_cart(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_cart(attrs \\ %{}) do
    %Cart{}
    |> Cart.changeset(attrs)
    |> Repo.insert()
  end
end
