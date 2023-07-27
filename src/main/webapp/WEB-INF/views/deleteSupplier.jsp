<%-- 
    Document   : deleteSupplier
    Created on : Jul 21, 2023, 12:14:21 AM
    Author     : ducan
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <title>Delete Supplier</title>
</head>
<body>
    <jsp:include page="/WEB-INF/views/navbar.jsp" />
    <h1>Delete Supplier</h1>
    <p>Are you sure you want to delete this supplier?</p>
    <p>ID: ${supplier.id}</p>
    <p>Name: ${supplier.name}</p>
    <p>Address: ${supplier.address}</p>
    <form action="${pageContext.request.contextPath}/admin-suppliers/confirmDelete" method="post">
        <input type="hidden" name="id" value="${supplier.id}">
        <input type="submit" value="Delete">
    </form>
    <br>
    <a href="${pageContext.request.contextPath}/admin-suppliers">Cancel</a>
</body>
</html>
