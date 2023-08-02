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
        <meta charset="UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    </head>
    <body>
        <jsp:include page="/WEB-INF/views/navbar.jsp" />
        <div class="container">
        
            <h1 class="mt-4 mb-4">Edit Category</h1>
            <form class="mt-3" action="${pageContext.request.contextPath}/admin-categories/update" method="post">
                <input type="hidden" name="id" value="${category.id}">
                <div class="form-group">
                    <label for="name">Name:</label>
                    <input type="text" class="form-control" name="name" value="${category.name}" required>
                </div>
                <div class="form-group">
                    <label for="description">Description:</label>
                    <input type="text" class="form-control" name="description" value="${category.description}">
                </div>
                <button type="submit" class="btn btn-primary">Save</button>
            </form>
            <a href="${pageContext.request.contextPath}/admin-categories" class="btn btn-secondary mt-3">Back to List</a>
        </div>

    </body>

</html>

