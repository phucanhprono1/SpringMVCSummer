<%-- 
    Document   : deleteProduct
    Created on : Jul 21, 2023, 9:35:16 PM
    Author     : ducan
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <title>Delete Product</title>
    </head>
    <body>
        <jsp:include page="/WEB-INF/views/navbar.jsp" />
        <div class="container">

            <h1 class="mt-4 mb-4">Delete Product</h1>


            <p>Are you sure you want to delete this product?</p>
            <p>ID: ${product.id}</p>
            <p>Name: ${product.name}</p>
            <p>Price: ${product.price}</p>
            <p>Quantity: ${product.quantity}</p>

            <form class="mt-3" action="${pageContext.request.contextPath}/admin-products/confirmDelete" method="post">
                <input type="hidden" name="id" value="${product.id}">
                <button type="submit" class="btn btn-danger">Delete</button>
            </form>


            <a href="${pageContext.request.contextPath}/admin-products" class="btn btn-secondary mt-3">Cancel</a>
        </div>
    </body>

</html>

