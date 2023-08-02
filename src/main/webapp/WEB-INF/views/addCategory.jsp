<%-- 
    Document   : addCategory
    Created on : Jul 20, 2023, 3:48:49 PM
    Author     : ducan
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <title>Add Category</title>
</head>
<body>
    <jsp:include page="/WEB-INF/views/navbar.jsp" />
    <h1>Add Category</h1>
    <form action="${pageContext.request.contextPath}/admin-categories/add" method="post">
        <label for="name">Name:</label>
        <input type="text" name="name" required>
        <br>
        <label for="description">Description:</label>
        <input type="text" name="description">
        <br>
        <input type="submit" value="Add">
    </form>
</body>
</html>