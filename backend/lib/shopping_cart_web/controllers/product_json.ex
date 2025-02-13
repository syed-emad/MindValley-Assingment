defmodule ShoppingCartWeb.ProductJSON do
  alias ShoppingCart.Products.Product

  @doc """
  Renders a list of products.
  """
  def index(%{products: products}) do
    %{data: for(product <- products, do: data(product))}
  end

  @doc """
  Renders a single product.
  """
  def show(%{product: product}) do
    %{data: data(product)}
  end

  defp data(%Product{} = product) do
    %{
      id: product.id,
      name: product.name,
      price: product.price,
      description: product.description,
      quantity: product.quantity,
      image_url: product.image_url
    }
  end
end
