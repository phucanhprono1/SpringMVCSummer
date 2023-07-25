<%-- 
    Document   : editProduct
    Created on : Jul 21, 2023, 9:34:52 PM
    Author     : ducan
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <label for="category">Category:</label>
        <select name="category.id" required>
            <c:forEach items="${categories}" var="category">
                <option value="${category.id}" ${product.category.id == category.id ? 'selected' : ''}>${category.name}</option>
            </c:forEach>
        </select>
        <br>
        <label for="supplier">Supplier:</label>
        <select name="supplier.id" required>
            <c:forEach items="${suppliers}" var="supplier">
                <option value="${supplier.id}" ${product.supplier.id == supplier.id ? 'selected' : ''}>${supplier.name}</option>
            </c:forEach>
        </select>
        <br>
        <label for="color">Color:</label>
        <input type="text" name="color" value="${product.color}">
        <br>
        <label for="description">Description:</label>
        <textarea name="description">${product.description}</textarea>
        <br>
        <label for="image">Image:</label>
        <input type="text" name="image" value="${product.image}">
        <br>
        <label for="size">Size:</label>
        <input type="text" name="size" value="${product.size}">
        <br>
        <label for="gender">Gender:</label>
        <select name="gender" required>
            <option value="Male" ${product.gender == 'Male' ? 'selected' : ''}>Male</option>
            <option value="Female" ${product.gender == 'Female' ? 'selected' : ''}>Female</option>
            <option value="Unisex" ${product.gender == 'Unisex' ? 'selected' : ''}>Unisex</option>
        </select>
        <br>
        <label for="brand">Brand:</label>
        <input type="text" name="brand" value="${product.brand}">
        <br>
        <label for="numberSell">Number Sell:</label>
        <input type="number" name="numberSell" value="${product.numberSell}">
        <br>
        <!-- You can choose how to handle the productHistories and listComment fields (e.g., display them in the form or handle them separately) -->

        <input type="submit" value="Save">
    </form>
    <br>
    <a href="${pageContext.request.contextPath}/products/list">Back to List</a>
</body>
</html>

