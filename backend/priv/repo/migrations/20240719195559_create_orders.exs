defmodule ShoppingCart.Repo.Migrations.CreateOrders do
  use Ecto.Migration

  def change do
    create table(:orders) do
      add :quantity, :integer
      add :price, :decimal
      add :total_price, :decimal
      add :product_id, references(:products, on_delete: :nothing)

      timestamps(type: :utc_datetime)
    end

    create index(:orders, [:product_id])
  end
end
