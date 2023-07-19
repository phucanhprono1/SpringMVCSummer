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
            gravity:center;
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
            <tr>
                <td>${item.product.name}</td>
                <td class="cart-item">
                    
                    <div class="actions">
                        <button onclick="increaseQuantity(${item.id})">+</button>
                        <span class="quantity">{item.quantity}</span>
                        <button onclick="decreaseQuantity(${item.id})">-</button>
                    </div>
                </td>
                <td>${item.product.price}</td>
            </tr>
        </c:forEach>
    </table>
    <p>Total Price: ${cart.totalPrice}</p>
</body>
</html>
