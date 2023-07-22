<%-- 
    Document   : editProduct
    Created on : Jul 21, 2023, 9:34:52 PM
    Author     : ducan
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <title>Edit Product</title>
</head>
<body>
    <h1>Edit Product</h1>
    <form action="${pageContext.request.contextPath}/products/update" method="post">
        <input type="hidden" name="id" value="${product.id}">
        <input type="hidden" name="oldQuantity" value="${product.quantity}">
        <label for="name">Name:</label>
        <input type="text" name="name" value="${product.name}" required>
        <br>
        <label for="price">Price:</label>
        <input type="text" name="price" value="${product.price}" required>
        <br>
        <label for="quantity">Quantity:</label>
        <input type="text" name="quantity" value="${product.quantity}" required>
        <br>
        <!-- Add other input fields for the product -->
        <br>
        <input type="submit" value="Save">
    </form>
    <br>
    <a href="${pageContext.request.contextPath}/products/list">Back to List</a>
</body>
</html>
