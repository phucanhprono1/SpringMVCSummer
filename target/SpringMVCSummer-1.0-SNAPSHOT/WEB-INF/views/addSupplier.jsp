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
        <meta charset="UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    </head>
    <body>

        <jsp:include page="/WEB-INF/views/navbar.jsp" />
        <div class="container">


            <!-- Tiêu đề trang -->
            <h1 class="mt-4 mb-4">Add Supplier</h1>

            <!-- Form thêm nhà cung cấp -->
            <form class="mt-3" action="${pageContext.request.contextPath}/admin-suppliers/add" method="post">
                <div class="form-group">
                    <label for="name">Name:</label>
                    <input type="text" class="form-control" name="name" required>
                </div>
                <div class="form-group">
                    <label for="address">Address:</label>
                    <input type="text" class="form-control" name="address">
                </div>
                <button type="submit" class="btn btn-primary">Add</button>
            </form>
            <a href="${pageContext.request.contextPath}/admin-suppliers" class="btn btn-secondary mt-3">Back to List</a>
        </div>

        <!-- Thêm đường dẫn đến các thư viện Bootstrap JS và jQuery -->
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.0.7/dist/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </body>

</html>
