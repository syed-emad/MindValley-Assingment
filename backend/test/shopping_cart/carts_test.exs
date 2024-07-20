defmodule ShoppingCart.CartsTest do
  use ShoppingCart.DataCase

  alias ShoppingCart.Carts

  describe "carts" do
    alias ShoppingCart.Carts.Cart

    import ShoppingCart.CartsFixtures

    @invalid_attrs %{userEmail: nil, totalAmount: nil}

    test "list_carts/0 returns all carts" do
      cart = cart_fixture()
      assert Carts.list_carts() == [cart]
    end

    test "get_cart!/1 returns the cart with given id" do
      cart = cart_fixture()
      assert Carts.get_cart!(cart.id) == cart
    end

    test "create_cart/1 with valid data creates a cart" do
      valid_attrs = %{userEmail: "some userEmail", totalAmount: "120.5"}

      assert {:ok, %Cart{} = cart} = Carts.create_cart(valid_attrs)
      assert cart.userEmail == "some userEmail"
      assert cart.totalAmount == Decimal.new("120.5")
    end

    test "create_cart/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Carts.create_cart(@invalid_attrs)
    end

    test "update_cart/2 with valid data updates the cart" do
      cart = cart_fixture()
      update_attrs = %{userEmail: "some updated userEmail", totalAmount: "456.7"}

      assert {:ok, %Cart{} = cart} = Carts.update_cart(cart, update_attrs)
      assert cart.userEmail == "some updated userEmail"
      assert cart.totalAmount == Decimal.new("456.7")
    end

    test "update_cart/2 with invalid data returns error changeset" do
      cart = cart_fixture()
      assert {:error, %Ecto.Changeset{}} = Carts.update_cart(cart, @invalid_attrs)
      assert cart == Carts.get_cart!(cart.id)
    end

    test "delete_cart/1 deletes the cart" do
      cart = cart_fixture()
      assert {:ok, %Cart{}} = Carts.delete_cart(cart)
      assert_raise Ecto.NoResultsError, fn -> Carts.get_cart!(cart.id) end
    end

    test "change_cart/1 returns a cart changeset" do
      cart = cart_fixture()
      assert %Ecto.Changeset{} = Carts.change_cart(cart)
    end
  end
end
