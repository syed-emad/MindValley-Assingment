# Front End

### Main Page

For **View Products,** You can click on any item to view its detail and add it to cart.

![1721586105515](image/README/1721586105515.png)

### Product Detail page

For **Add Item to Carts** You can see the product details and add item to cart

![1721586293304](image/README/1721586293304.png)

When you click **Add to Cart** , product is added to cart and message is show

![1721586339094](image/README/1721586339094.png)

### Cart Page

For **Confirm Purchase** In the cart page you can view your cart and confirm order

![1721586516443](image/README/1721586516443.png)

You can click on order now to confirm order

### Order Confirm Page

![1721586573539](image/README/1721586573539.png)

# Backend

## Database

![1721610834678](image/NOTES/1721610834678.png)

### **Tables**

#### Product

###### **Usage** :

* Used to maintain a catalog of available products.
* Each row represents a unique product with associated details.

#### Cart

###### Usage

* Stores essential information about each order made by users.
* Links to `orders` table to establish relationships between orders and products ordered.

#### Order

This table serves as an intermediary table to manage the many-to-many relationship between orders and products.

###### **Usage** :

* Captures which products were included in each order and in what quantities.
* Enables efficient querying of products associated with a specific order.
