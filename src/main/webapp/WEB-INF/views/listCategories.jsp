<%-- 
    Document   : listCategories
    Created on : Jul 20, 2023, 3:47:58 PM
    Author     : ducan
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
    <head>
        <title>Categories List</title>
    </head>
    <body>
        <jsp:include page="/WEB-INF/views/navbar.jsp" />
        <h1>Categories List</h1>
        <form action="${pageContext.request.contextPath}/categories/searchByName" method="get">
            <input type="text" name="name" placeholder="Enter category name">
            <input type="submit" value="Search">
        </form>
        <br>
        <table class="table table-hover table-responsive-md">
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Description</th>
                <th>Edit</th>
                <th>Delete</th>
            </tr>
            <c:forEach items="${categories}" var="category">
                <tr>
                    <td>${category.id}</td>
                    <td>${category.name}</td>
                    <td>${category.description}</td>
                    <td><a href="${pageContext.request.contextPath}/admin-categories/showEditForm?id=${category.id}">Edit</a></td>
                    <td><a href="${pageContext.request.contextPath}/admin-categories/showDeleteForm?id=${category.id}">Delete</a></td>
                </tr>
            </c:forEach>
        </table>
        <br>
        <a href="${pageContext.request.contextPath}/admin-categories/showAddForm">Add Category</a>
    </body>
</html>