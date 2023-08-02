<%-- 
    Document   : addOrder
    Created on : Jul 29, 2023, 8:54:36 PM
    Author     : Phuc Anh
--%>

<!-- addOrder.jsp -->

<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
    <head>
        <title>Add Order</title>
        <!-- Include Bootstrap CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <style>
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
            <h1>Add Order</h1>
            <h2>Cart</h2>
            <table class="table table-striped">
                <thead>
                    <tr>
                        <th>Product Name</th>
                        <th>Quantity</th>
                        <th>Price</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${cart.cartItems}" var="item">
                        <tr>
                            <td>${item.product.name}</td>
                            <td>${item.quantity}</td>
                            <td>${item.product.price}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
            <p>Total Price: <span id="total-price">${cart.total_price}</span></p>

            <!-- Order form -->
            <form action="${pageContext.request.contextPath}/order/submitOrder" method="post">
                <!-- Add any additional form fields for the order (e.g., address, payment method) -->
                <div class="form-group">
                    <label for="address">Address:</label>
                    <input type="text" id="address" name="address" class="form-control" required>
                </div>

                <div class="form-group">
                    <label for="paymentMethod">Payment Method:</label>
                    <input type="text" id="paymentMethod" name="paymentMethod" class="form-control" required>
                </div>

                <button type="submit" class="btn btn-success">Place Order</button>
            </form>
            <!-- Display error message if any -->
            <c:if test="${not empty errorMessage}">
                <div class="alert alert-danger mt-4">
                    ${errorMessage}
                </div>
            </c:if>
        </div>

        <!-- Include Bootstrap JS -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </body>
</html>
