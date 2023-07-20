<%-- 
    Document   : addSupplier
    Created on : Jul 21, 2023, 12:13:17 AM
    Author     : ducan
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <title>Add Supplier</title>
</head>
<body>
    <h1>Add Supplier</h1>
    <form action="${pageContext.request.contextPath}/suppliers/add" method="post">
        <label for="name">Name:</label>
        <input type="text" name="name" required>
        <br>
        <label for="address">Address:</label>
        <input type="text" name="address">
        <br>
        <input type="submit" value="Add">
    </form>
    <br>
    <a href="${pageContext.request.contextPath}/suppliers/list">Back to List</a>
</body>
</html>