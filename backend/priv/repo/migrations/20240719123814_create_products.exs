defmodule ShoppingCart.Repo.Migrations.CreateProducts do
  use Ecto.Migration

  def change do
    create table(:products) do
      add :name, :string
      add :price, :decimal
      add :description, :text
      add :quantity, :integer
      add :image_url, :string
      timestamps(type: :utc_datetime)
    end
  end
end
