defmodule ShoppingCart.Products do
  @moduledoc """
  The Products context.
  """

  import Ecto.Query, warn: false
  alias ShoppingCart.Repo

  alias ShoppingCart.Products.Product

  @doc """
  Returns the list of products.

  ## Examples

      iex> list_products()
      [%Product{}, ...]

  """
  def list_products do
    Repo.all(Product)
  end

  @doc """
  Gets a single product.

  Raises `Ecto.NoResultsError` if the Product does not exist.

  ## Examples

      iex> get_product!(123)
      %Product{}

      iex> get_product!(456)
      ** (Ecto.NoResultsError)

  """
  def get_product!(id), do: Repo.get!(Product, id)

  @doc """
  Creates a product.

  ## Examples

      iex> create_product(%{field: value})
      {:ok, %Product{}}

      iex> create_product(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_product(attrs \\ %{}) do
    IO.inspect( label: "INSIDE PRODUCES")
    %Product{}
    |> Product.changeset(attrs)
    |> Repo.insert()
  end

  def order_product(productId,quantity) do
    product = get_product!(productId)
    new_quantity = product.quantity-quantity

    product
    |> Product.changeset(%{quantity: new_quantity})
    |> Repo.update()
  end
end
