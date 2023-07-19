<%-- 
    Document   : cart
    Created on : Jul 19, 2023, 7:52:12 AM
    Author     : Phuc Anh
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- cart.jsp -->

<html>
<head>
    <title>Cart</title>
    <style>
        .cart-item {
            display: flex;
            align-items: center;
        }

        .quantity {
            text-align: center;
        }

        .actions {
            margin-left: auto;
        }
    </style>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
        function increaseQuantity(cartItemId) {
            $.ajax({
                type: "PUT",
                url: "/cart/increaseQuantity/" + cartItemId,
                success: function (data) {
                    $("#quantity-" + cartItemId).text(data.quantity);
                },
                error: function () {
                    alert("Failed to increase quantity.");
                }
            });
        }

        function decreaseQuantity(cartItemId) {
            $.ajax({
                type: "PUT",
                url: "/cart/decreaseQuantity/" + cartItemId,
                success: function (data) {
                    $("#quantity-" + cartItemId).text(data.quantity);
                },
                error: function () {
                    alert("Failed to decrease quantity.");
                }
            });
        }
    </script>
    <script>
        function removeItem(cartItemId) {
            $.ajax({
                type: "PUT",
                url: "/cart/remove/${cart.user.id}/${cartItemId}",
                success: function (data) {
                    $("#cart-item-" + cartItemId).remove();
                    $("#total-price").text(data.total_price);
                },
                error: function () {
                    alert("Failed to remove item from cart.");
                }
            });
        }

        function removeAllItems() {
            $.ajax({
                type: "DELETE",
                url: "/cart/removeAll/${cart.user.id}",
                success: function () {
                    location.reload();
                },
                error: function () {
                    alert("Failed to remove all items from cart.");
                }
            });
        }
       
    });
    </script>
</head>
<body>
    <h1>Cart</h1>
    <table>
        <tr>
            <th>Product Name</th>
            <th>Quantity</th>
            <th>Price</th>
            <th>Actions</th>
        </tr>
        <c:forEach items="${cart.cartItems}" var="item">
            <tr id="cart-item-${item.id}">
                <td>${item.product.name}</td>
                <td class="cart-item">
                    <div class="actions">
                        <button onclick="increaseQuantity(${item.id})">+</button>
                        <span class="quantity">${item.quantity}</span>
                        <button onclick="decreaseQuantity(${item.id})">-</button>
                    </div>
                </td>
                <td>${item.product.price}</td>
                <td><button onclick="removeItem(${item.id})">Remove</button></td>
            </tr>
        </c:forEach>
    </table>
    <p>Total Price: <span id="total-price">${cart.total_price}</span></p>
    <button onclick="removeAllItems()">Remove All</button>
</body>
</html>
