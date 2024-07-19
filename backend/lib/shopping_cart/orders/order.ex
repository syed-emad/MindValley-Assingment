defmodule ShoppingCart.Orders.Order do
  use Ecto.Schema
  import Ecto.Changeset

  schema "orders" do
    field :quantity, :integer
    field :price, :decimal
    field :total_price, :decimal
    field :product_id, :id

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(order, attrs) do
    order
    |> cast(attrs, [:quantity, :price, :total_price,:product_id])
    |> validate_required([:quantity, :price, :total_price])
  end
end
