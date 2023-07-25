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
            <th>Brand</th>
            <th>Image</th>
            <th>Price</th>
            <th>Quantity</th>
            <th>Category</th>
            <th>Supplier</th>
            <th>Edit</th>
            <th>Delete</th>
        </tr>
        <c:forEach items="${products}" var="product">
            <tr>
                <td>${product.id}</td>
                <td>${product.name}</td>
                <td>${product.brand}</td>
                <td><img width="50dp" height="50dp" src="${product.image}" alt="Image placeholder" class="img-fluid"></td>
                <td>${product.price}</td>
                <td>${product.quantity}</td>
                <td>${product.category.name}</td>
                <td>${product.supplier.name}</td>
                <td><a href="${pageContext.request.contextPath}/products/showEditForm?id=${product.id}">Edit</a></td>
                <td><a href="${pageContext.request.contextPath}/products/showDeleteForm?id=${product.id}">Delete</a></td>
            </tr>
        </c:forEach>
    </table>
    <br>
    <a href="${pageContext.request.contextPath}/products/showAddForm">Add Product</a>
</body>
</html>
