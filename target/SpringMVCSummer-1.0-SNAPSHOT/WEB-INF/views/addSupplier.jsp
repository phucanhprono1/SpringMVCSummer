<%-- 
    Document   : addSupplier
    Created on : Jul 21, 2023, 12:13:17 AM
    Author     : ducan
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <title>Add Supplier</title>
</head>
<body>
    <jsp:include page="/WEB-INF/views/navbar.jsp" />
    <h1>Add Supplier</h1>
    <form action="${pageContext.request.contextPath}/admin-suppliers/add" method="post">
        <label for="name">Name:</label>
        <input type="text" name="name" required>
        <br>
        <label for="address">Address:</label>
        <input type="text" name="address">
        <br>
        <input type="submit" value="Add">
    </form>
    <br>
    <a href="${pageContext.request.contextPath}/admin-suppliers">Back to List</a>
</body>
</html>
