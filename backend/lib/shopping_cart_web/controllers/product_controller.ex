defmodule ShoppingCartWeb.ProductController do
  use ShoppingCartWeb, :controller

  alias ShoppingCart.Products
  alias ShoppingCart.Products.Product

  action_fallback ShoppingCartWeb.FallbackController

  def index(conn, _params) do
    products = Products.list_products()
    render(conn, :index, products: products)
  end

  def create(conn, %{"product" => product_params}) do
    with {:ok, %Product{} = product} <- Products.create_product(product_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", ~p"/api/products/#{product}")
      |> render(:show, product: product)
    end
  end

  def show(conn, %{"id" => id}) do
    product = Products.get_product!(id)
    render(conn, :show, product: product)
  end

  # def update_order(conn, %{"id" => id}) do
  #   product = Products.get_product!(id)

  #   # Assuming you have a function in your Products context to decrement quantity
  #   with {:ok, %Product{} = updated_product} <- Products.decrement_product_quantity(product) do
  #     render(conn, :show, product: updated_product)
  #   end
  # end

  def order(conn, %{"id"=>id}) do
    product = Products.get_product!(id)
    with{:ok,%Product{}=updated_product}<- Products.order_product(product) do
      render(conn, :show, product: updated_product)
    end
  end

  def delete(conn, %{"id" => id}) do
    product = Products.get_product!(id)

    with {:ok, %Product{}} <- Products.delete_product(product) do
      send_resp(conn, :no_content, "")
    end
  end
end
