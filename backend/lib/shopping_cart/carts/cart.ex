defmodule ShoppingCart.Carts.Cart do
  use Ecto.Schema
  import Ecto.Changeset

  schema "carts" do
    field :userEmail, :string
    field :totalAmount, :decimal
    field :name, :string
    field :address, :string
    field :city, :string
    field :country, :string
    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(cart, attrs) do
    cart
    |> cast(attrs, [:userEmail, :totalAmount, :name, :address, :city, :country])
    |> validate_required([:userEmail, :totalAmount,:name, :address, :city, :country])
  end
end
