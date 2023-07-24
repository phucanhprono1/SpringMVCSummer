<%-- 
    Document   : addProduct
    Created on : Jul 21, 2023, 9:58:21 PM
    Author     : ducan
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <title>Add Product</title>
    </head>
    <body>
        <h1>Add Product</h1>
        <form action="${pageContext.request.contextPath}/products/checkProduct" method="post">
            <label for="name">Product Name:</label>
            <input type="text" name="name" required>
            <br>
            <input type="submit" value="Check Product">
        </form>

        <c:if test="${existingProduct ne null}">
            <h2>Product already exists with the name: ${existingProduct.name}</h2>
            <h3>Current Quantity: ${existingProduct.quantity}</h3>
            <h3>Enter additional quantity to update:</h3>
            <form action="${pageContext.request.contextPath}/products/updateQuantity" method="post">
                <input type="hidden" name="id" value="${existingProduct.id}">
                <input type="hidden" name="oldQuantity" value="${existingProduct.quantity}">
                <label for="quantity">Additional Quantity:</label>
                <input type="number" name="quantity" required>
                <br>
                <input type="submit" value="Update Quantity">
            </form>
        </c:if>

        <c:if test="${existingProduct eq null}">
            <h2>Product does not exist. Add new product:</h2>
            <form action="${pageContext.request.contextPath}/products/addNew" method="post">
                <label for="name">Product Name:</label>
                <input type="text" name="name" value="${param.name}" required readonly>
                <br>
                <label for="price">Price:</label>
                <input type="number" name="price" required>
                <br>
                <label for="quantity">Quantity:</label>
                <input type="number" name="quantity" required>
                <br>
                <select name="category" required>
                    <c:forEach items="${categories}" var="category">
                        <option value="${category.id}">${category.name}</option>
                    </c:forEach>
                </select>
                <br>
                <label for="supplier">Supplier:</label>
                <select name="supplier" required>
                    <c:forEach items="${suppliers}" var="supplier">
                        <option value="${supplier.id}">${supplier.name}</option>
                    </c:forEach>
                </select>
                <br>
                <c:set var="emptyList" value="[]" />
                <input type="hidden" name="listComment" value="${emptyList}" />
                <!-- Add other input fields for the product -->
                <br>
                <label for="color">Color:</label>
                <input type="text" name="color">
                <br>
                <label for="description">Description:</label>
                <textarea name="description"></textarea>
                <br>
                <label for="image">Image:</label>
                <input type="text" name="image">
                <br>
                <label for="size">Size:</label>
                <input type="text" name="size">
                <br>
                <label for="gender">Gender:</label>
                <select name="gender" required>
                    <option value="Male">Male</option>
                    <option value="Female">Female</option>
                    <option value="Unisex">Unisex</option>
                </select>
                <br>
                <label for="brand">Brand:</label>
                <input type="text" name="brand">
                <br>
                <label for="numberSell">Number Sell:</label>
                <input type="hidden" name="numberSell" value="0">
                <br>
                <input type="submit" value="Add Product">
            </form>
        </c:if>

        <br>
        <a href="${pageContext.request.contextPath}/products/list">Back to List</a>
    </body>
</html>


