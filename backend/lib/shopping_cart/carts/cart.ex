defmodule ShoppingCart.Carts.Cart do
  use Ecto.Schema
  import Ecto.Changeset

  schema "carts" do
    field :userEmail, :string
    field :totalAmount, :decimal

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(cart, attrs) do
    cart
    |> cast(attrs, [:userEmail, :totalAmount])
    |> validate_required([:userEmail, :totalAmount])
  end
end
