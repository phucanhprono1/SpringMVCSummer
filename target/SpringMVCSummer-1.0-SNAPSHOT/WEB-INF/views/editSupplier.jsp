<%-- 
    Document   : editSupplier
    Created on : Jul 21, 2023, 12:13:57 AM
    Author     : ducan
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <title>Edit Supplier</title>
</head>
<body>
    <h1>Edit Supplier</h1>
    <form action="${pageContext.request.contextPath}/suppliers/update" method="post">
        <input type="hidden" name="id" value="${supplier.id}">
        <label for="name">Name:</label>
        <input type="text" name="name" value="${supplier.name}" required>
        <br>
        <label for="address">Address:</label>
        <input type="text" name="address" value="${supplier.address}">
        <br>
        <input type="submit" value="Save">
    </form>
    <br>
    <a href="${pageContext.request.contextPath}/suppliers/list">Back to List</a>
</body>
</html>
