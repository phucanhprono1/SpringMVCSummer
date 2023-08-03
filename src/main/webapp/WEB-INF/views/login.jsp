<%-- 
    Document   : login
    Created on : Jul 30, 2023, 5:06:50 PM
    Author     : Phuc Anh
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Login</title>
        <!-- Include Bootstrap 5.3 CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body>
        <div class="container mt-4">
            <h1>Login</h1>
            <c:if test="${not empty error}">
                <p style="color: red;">${error}</p>
            </c:if>
            <form action="${pageContext.request.contextPath}/login" method="post">
                <div class="mb-3">
                    <label for="username" class="form-label">Username:</label>
                    <input type="text" name="username" id="username" class="form-control" required/>
                </div>
                <div class="mb-3">
                    <label for="password" class="form-label">Password:</label>
                    <input type="password" name="password" id="password" class="form-control" required/>
                </div>
                <button type="submit" class="btn btn-primary">Login</button>
            </form>
            <div class="mt-3">
                <p>If you don't have an account, <a href="${pageContext.request.contextPath}/register">register here</a>.</p>
            </div>
        </div>

        <!-- Include Bootstrap 5.3 JS -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>