<%-- 
    Document   : editCategory
    Created on : Jul 20, 2023, 4:00:46 PM
    Author     : ducan
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <title>Edit Category</title>
</head>
<body>
    <h1>Edit Category</h1>
    <form action="${pageContext.request.contextPath}/categories/update" method="post">
        <input type="hidden" name="id" value="${category.id}">
        <label for="name">Name:</label>
        <input type="text" name="name" value="${category.name}" required>
        <br>
        <label for="description">Description:</label>
        <input type="text" name="description" value="${category.description}">
        <br>
        <input type="submit" value="Save">
    </form>
</body>
</html>

