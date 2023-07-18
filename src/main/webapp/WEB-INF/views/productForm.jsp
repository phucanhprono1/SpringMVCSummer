<%-- 
    Document   : productForm
    Created on : Jul 16, 2023, 8:24:52 PM
    Author     : ducan
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Add or Update Product</title>
    </head>
    <body>
        <h1>Add or Update Product</h1>
        <form action="${pageContext.request.contextPath}/products/save" method="post">
            <input type="hidden" name="id" value="${product.id}" />

            <label for="name">Name:</label>
            <input type="text" name="name" value="${product.name}" />

            <!-- Các trường thông tin khác -->

            <label for="quantity">Quantity:</label>
            <input type="number" name="quantity" value="${product.quantity}" />

            <button type="submit">Save</button>
        </form>
    </body>
</html>