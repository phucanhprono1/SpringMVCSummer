<%-- 
    Document   : deleteSupplier
    Created on : Jul 21, 2023, 12:14:21 AM
    Author     : ducan
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Delete Supplier</title>
    </head>
    <body>   
        <jsp:include page="/WEB-INF/views/navbar.jsp" />
        <div class="container">
            <h1 class="mt-4 mb-4">Delete Supplier</h1>

            <p>Are you sure you want to delete this supplier?</p>
            <p>ID: ${supplier.id}</p>
            <p>Name: ${supplier.name}</p>
            <p>Address: ${supplier.address}</p>

            <form class="mt-3" action="${pageContext.request.contextPath}/admin-suppliers/confirmDelete" method="post">
                <input type="hidden" name="id" value="${supplier.id}">
                <button type="submit" class="btn btn-danger">Delete</button>
            </form>
            <a href="${pageContext.request.contextPath}/admin-suppliers" class="btn btn-secondary mt-3">Cancel</a>
        </div>
    </body>

</html>
