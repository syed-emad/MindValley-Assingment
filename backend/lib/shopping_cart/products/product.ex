defmodule ShoppingCart.Products.Product do
  use Ecto.Schema
  import Ecto.Changeset

  schema "products" do
    field :name, :string
    field :description, :string
    field :price, :decimal
    field :quantity, :integer
    field :image_url, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(product, attrs) do
    product
    |> cast(attrs, [:name, :price, :description, :quantity,:image_url])
    |> validate_required([:name, :price, :description, :quantity,:image_url])
  end

  def update_product_and_decrement(product,product_params,quantity) do
    product
    |> update_product(product_params)
    |> decrement_quantity(quantity)
  end

  def update_product(product, product_params) do
    product
    |> cast(product_params, [:name, :price, :description, :quantity, :image_url])
    |> validate_required([:name, :price, :description, :quantity, :image_url])
  end

  def decrement_quantity(product,quantity) do
    product
    |> cast(%{quantity: product.quantity - quantity},[:quantity])
      |> validate_required([:quantity])
  end
end
