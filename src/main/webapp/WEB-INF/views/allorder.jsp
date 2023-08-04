<%-- 
    Document   : allorder
    Created on : Aug 4, 2023, 9:59:45 PM
    Author     : ducan
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>All Orders</title>
</head>
<body>
    <h1>All Orders</h1>
    <table border="1">
        <tr>
            <th>ID</th>
            <th>Date</th>
            <th>Status</th>
            <th>User</th>
            <th>Total</th>
        </tr>
        <c:forEach items="${orders}" var="order">
            <tr>
                <td>${order.id}</td>
                <td>${order.date}</td>
                <td>${order.orderStatus}</td>
                <td>${order.total_price}</td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>

