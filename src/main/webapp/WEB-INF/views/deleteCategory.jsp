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
        <meta charset="UTF-8">
    </head>
    <body>
        <jsp:include page="/WEB-INF/views/navbar.jsp" />
        <div class="container">
            <h1 class="mt-4 mb-4">Delete Category</h1>
            <p>Are you sure you want to delete the category "${category.name}"?</p>
           
            <form class="mt-3" action="${pageContext.request.contextPath}/admin-categories/confirmDelete" method="post">
                <input type="hidden" name="id" value="${category.id}">
                <button type="submit" class="btn btn-danger">Delete</button>
            </form>
            <a href="${pageContext.request.contextPath}/admin-categories" class="btn btn-secondary mt-3">Cancel</a>
        </div>

    </body>

</html>

