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
                display: flex;
                align-items: center;
                justify-content: center; /* Center the buttons horizontally */
            }
            .navbar-dark .navbar-brand {
                color: #fff;
            }

            .navbar-dark .navbar-nav .nav-link {
                color: #fff;
            }

            .navbar-dark .navbar-nav .nav-link:hover {
                color: #ddd;
            }

            /* Add a background color to the active link */
            .navbar-dark .navbar-nav .nav-link.active {
                color: #000;
                background-color: #fff;
            }

            /* Customize the background color of the navigation bar */
            .navbar-dark {
                background-color: #000;
            }
        </style>
    </head>
    <body>
        <jsp:include page="navBarUser.jsp"/>
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
                                <div class="actions" style="display: flex; align-items: center;">
                                    <form action="${pageContext.request.contextPath}/cart/decrease/${item.product.id}" method="POST">
                                        <input type="hidden" name="_method" value="POST">
                                        <button id="btn-add" type="submit" class="btn btn-sm btn-primary">-</button>
                                    </form>
                                    <span class="quantity" style="margin: 0 auto; display: flex; align-items: center;">${item.quantity}</span>
                                    <form action="${pageContext.request.contextPath}/cart/increase/${item.product.id}" method="POST">
                                        <input type="hidden" name="_method" value="POST">
                                        <button id="btn-sub" type="submit" class="btn btn-sm btn-primary">+</button>
                                    </form>
                                </div>
                            </td>
                            <td>${item.product.price}</td>
                            <td>
                                <form action="${pageContext.request.contextPath}/cart/remove/${item.product.id}" method="POST">
                                    <input type="hidden" name="_method" value="POST">
                                    <button type="submit" class="btn btn-sm btn-danger">Remove</button>
                                </form>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
            <p>Total Price: <span id="total-price">${cart.total_price}</span></p>
            <form action="${pageContext.request.contextPath}/cart/removeAll" method="POST">
                <input type="hidden" name="_method" value="POST">
                <button type="submit" class="btn btn-danger">Remove All</button>
            </form>
            <form action="${pageContext.request.contextPath}/order/orderForm" method="GET">
                <button type="submit" class="btn btn-success">Go to Order</button>
            </form>
        </div>


        <!-- Include Bootstrap JS -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </body>
</html>
