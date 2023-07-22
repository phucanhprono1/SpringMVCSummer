<%-- 
    Document   : listProducts
    Created on : Jul 21, 2023, 8:58:28 PM
    Author     : ducan
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <title>Products List</title>
</head>
<body>
    <h1>Products List</h1>
    <form action="${pageContext.request.contextPath}/products/searchByName" method="get">
        <input type="text" name="name" placeholder="Enter product name">
        <input type="submit" value="Search">
    </form>
    <br>
    <table>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Price</th>
            <th>Quantity</th>
            <th>Edit</th>
            <th>Delete</th>
        </tr>
        <c:forEach items="${products}" var="product">
            <tr>
                <td>${product.id}</td>
                <td>${product.name}</td>
                <td>${product.price}</td>
                <td>${product.quantity}</td>
                <td><a href="${pageContext.request.contextPath}/products/showEditForm?id=${product.id}">Edit</a></td>
                <td><a href="${pageContext.request.contextPath}/products/showDeleteForm?id=${product.id}">Delete</a></td>
            </tr>
        </c:forEach>
    </table>
    <br>
    <a href="${pageContext.request.contextPath}/products/showAddForm">Add Product</a>
</body>
</html>
