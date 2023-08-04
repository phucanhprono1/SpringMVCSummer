<%-- 
    Document   : orderHistory
    Created on : Aug 4, 2023, 6:19:58 PM
    Author     : Phuc Anh
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- Import Bootstrap 5.3.0 CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

<!DOCTYPE html>
<html>
    <head>
        <title>Order History</title>
    </head>
    <body>
        <jsp:include page="navBarUser.jsp"/>
        <div class="container">
            <h2>Order History</h2>
            <c:forEach var="order" items="${orderhistory}">
                <div class="card mb-3">
                    <div class="card-body">
                        <p>Order ID: ${order.id}</p>
                        <p>Date: ${order.date}</p>
                        <p>Order Status: ${order.orderStatus}</p>
                        <p>Location: ${order.location}</p>
                        <p>Total Price: ${order.total_price}</p>
                        <p>Payment Method: ${order.paymentMethod}</p>
                        <p>Payment Status: ${order.paymentStatus}</p>
                        <p>User: ${order.user.username}</p>
                        <p>Items:</p>
                        <ul>
                            <c:forEach var="orderItem" items="${order.orderItems}">
                                <li>
                                    <img src="${orderItem.product.image}" alt="${orderItem.product.name}" class="img-fluid" style="max-height: 100px;">
                                    ${orderItem.product.name} - Quantity: ${orderItem.quantity} - Price: ${orderItem.price}
                                </li>
                            </c:forEach>
                        </ul>
                    </div>
                </div>
            </c:forEach>
        </div>
    </body>
</html>