defmodule ShoppingCart.Repo.Migrations.CreateCarts do
  use Ecto.Migration

  def change do
    create table(:carts) do
      add :userEmail, :string
      add :totalAmount, :decimal
      add :name, :string
      add :address, :string
      add :city, :string
      add :country, :string
      timestamps(type: :utc_datetime)
    end
  end
end
