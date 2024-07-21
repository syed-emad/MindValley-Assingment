/**
 * @vitest-environment happy-dom
 */
import Products from "../views/Products.vue";
import { mount } from "@vue/test-utils";
import { describe, expect, it } from "vitest";
import ProductItem from "../components/ProductItem.vue";
import ProductDetail from "../views/ProductDetail.vue";
import Cart from "../views/Cart.vue";
import { store } from "../main";
import CartItem from "../components/CartItem.vue";
describe("UI Loaded", () => {
  describe("Product UI render", () => {
    const wrapper = mount(Products);
    it("renders product page title correctly", () => {
      expect(wrapper.find("h1").text()).toBe("Products");
    });

    it("checks for red text indicator", () => {
      expect(wrapper.find(".text-red-500").exists()).toBe(true);
    });

    it("checks for grid layout", () => {
      expect(wrapper.find(".grid").exists()).toBe(true);
    });
  });

  describe("Product Item UI render", () => {
    const product = {
      id: 1,
      name: "Sample Product",
      quantity: 5,
      price: "$19.99",
      image_url: "https://example.com/sample-image.jpg",
    };
    const wrapper = mount(ProductItem, {
      props: {
        product: product,
      },
    });
    it("renders product name correctly", () => {
      expect(wrapper.find(".text-gray-600").text()).toContain(product.name);
    });

    it("renders product quantity correctly", () => {
      expect(wrapper.find("#quantity").text()).toContain(
        `Quantity: ${product.quantity}`
      );
    });

    it("renders product price correctly", () => {
      expect(wrapper.find("#pricing").text()).toContain(product.price);
    });

    it("renders product image correctly", () => {
      expect(wrapper.find("img").attributes("src")).toBe(product.image_url);
    });

    it("checks for product item container", () => {
      expect(wrapper.find("#product-item").exists()).toBe(true);
    });

    it("checks for image area", () => {
      expect(wrapper.find("#image-area").exists()).toBe(true);
    });

    it("checks for detail area", () => {
      expect(wrapper.find("#detail-area").exists()).toBe(true);
    });
  });

  describe("Product Detail UI render", () => {
    it("renders product deatil detail view", () => {
      const mockProduct = {
        name: "Test Product",
        price: 20,
        description: "This is a test product",
        image_url: "test-image.png",
      };

      const wrapper = mount(ProductDetail, {
        props: {
          product: mockProduct,
        },
        global: {
          mocks: {
            $router: {
              go: () => {},
            },
            $route: {
              params: { id: 1 },
            },
          },
        },
      });
    });
  });

  describe("Cart UI render", () => {
    const wrapper = mount(Cart, {
      global: {
        plugins: [store],
      },
    });
    it("renders email input correctly", async () => {
      await wrapper.find("#email").setValue("test@example.com");
      expect(wrapper.find("#email").element.value).toBe("test@example.com");
    });

    it("renders name input correctly", async () => {
      await wrapper.find("#name").setValue("Emad Test");
      expect(wrapper.find("#name").element.value).toBe("Emad Test");
    });

    it("renders address input correctly", async () => {
      await wrapper.find("#address").setValue("123 Street");
      expect(wrapper.find("#address").element.value).toBe("123 Street");
    });

    it("renders city input correctly", async () => {
      await wrapper.find("#city").setValue("Cityville");
      expect(wrapper.find("#city").element.value).toBe("Cityville");
    });

    it("renders country input correctly", async () => {
      await wrapper.find("#country").setValue("Countryland");
      expect(wrapper.find("#country").element.value).toBe("Countryland");
    });
  });

  describe("Cart Item UI render", () => {
    const item = {
      id: 1,
      name: "Product 1",
      price: 10,
      orderQuantity: 2,
      image_url: "path/to/image.png",
    };

    const wrapper = mount(CartItem, {
      props: {
        item,
      },
    });
    it("renders cart item name correctly", () => {
      expect(wrapper.find("p.text-md.font-medium.text-gray-600").text()).toBe(
        "Product 1"
      );
    });

    it("renders cart item price correctly", () => {
      const item = {
        id: 1,
        name: "Product 1",
        price: 10,
        orderQuantity: 2,
        image_url: "path/to/image.png",
      };

      const wrapper = mount(CartItem, {
        props: {
          item,
        },
      });

      expect(wrapper.find("#price").text()).toContain("10");
    });

    it("renders cart item quantity correctly", () => {
      expect(wrapper.find("#quantity").text()).toBe("Quantity: 2");
    });

    it("renders cart item image correctly", () => {
      expect(wrapper.find("img").attributes("src")).toBe("path/to/image.png");
    });
  });
});
