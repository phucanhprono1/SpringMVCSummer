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
        <meta charset="UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <link rel="stylesheet" href="/path/to/custom.css">
    </head>

    <body>
        <jsp:include page="/WEB-INF/views/navbar.jsp" />
        <!-- Thêm class "container" để giới hạn chiều rộng của nội dung -->
        <div class="container">

            <!-- Tiêu đề trang -->
            <h1 class="mt-4 mb-4">Add Category</h1>

            <!-- Form thêm danh mục -->
            <form class="mt-3" action="${pageContext.request.contextPath}/admin-categories/add" method="post">
                <div class="form-group">
                    <label for="name">Name:</label>
                    <input type="text" class="form-control" name="name" required>
                </div>
                <div class="form-group">
                    <label for="description">Description:</label>
                    <input type="text" class="form-control" name="description">
                </div>
                <button type="submit" class="btn btn-primary">Add</button>
            </form>
            <a href="${pageContext.request.contextPath}/admin-categories" class="btn btn-secondary mt-3">Back to List</a>
        </div>
    </body>



</html>