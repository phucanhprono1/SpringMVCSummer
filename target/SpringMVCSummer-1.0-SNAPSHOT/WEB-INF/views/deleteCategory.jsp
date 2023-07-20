<%-- 
    Document   : deleteCategory
    Created on : Jul 20, 2023, 4:00:09 PM
    Author     : ducan
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <title>Delete Category</title>
</head>
<body>
    <h1>Delete Category</h1>
    <p>Are you sure you want to delete the category "${category.name}"?</p>
    <form action="${pageContext.request.contextPath}/categories/confirmDelete" method="post">
        <input type="hidden" name="id" value="${category.id}">
        <input type="submit" value="Delete">
    </form>
</body>
</html>

