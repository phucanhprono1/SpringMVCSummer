<%-- 
    Document   : cart
    Created on : Jul 19, 2023, 7:52:12 AM
    Author     : Phuc Anh
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- cart.jsp -->

<html>
<head>
    <title>Cart</title>
    <!-- Include Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
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
        // ... Your existing JavaScript code ...
    </script>
</head>
<body>
    <div class="container mt-4">
        <h1>Cart</h1>
        <table class="table table-striped">
            <thead>
                <tr>
                    <th>Product Name</th>
                    <th>Quantity</th>
                    <th>Price</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${cart.cartItems}" var="item">
                    <tr id="cart-item-${item.id}">
                        <td>${item.product.name}</td>
                        <td class="cart-item">
                            <div class="actions">
                                <button onclick="increaseQuantity(${item.id})" class="btn btn-sm btn-primary">+</button>
                                <span class="quantity">${item.quantity}</span>
                                <button onclick="decreaseQuantity(${item.id})" class="btn btn-sm btn-primary">-</button>
                            </div>
                        </td>
                        <td>${item.product.price}</td>
                        <td><button onclick="removeItem(${item.id})" class="btn btn-sm btn-danger">Remove</button></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        <p>Total Price: <span id="total-price">${cart.total_price}</span></p>
        <button onclick="removeAllItems()" class="btn btn-danger">Remove All</button>
    </div>

    <!-- Include Bootstrap JS -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
