<%-- 
    Document   : register
    Created on : Jul 30, 2023, 5:43:50 PM
    Author     : Phuc Anh
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Registration</title>
        <!-- Include Bootstrap 5.3 CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body>
        <div class="container mt-4">
            <h1>Registration</h1>
            <form action="${pageContext.request.contextPath}/register" method="post">
                <div class="mb-3">
                    <label for="email" class="form-label">Email:</label>
                    <input type="text" name="email" id="email" class="form-control" required>
                </div>
                <div class="mb-3">
                    <label for="name" class="form-label">Name:</label>
                    <input type="text" name="name" id="name" class="form-control" required>
                </div>
                <div class="mb-3">
                    <label for="username" class="form-label">Username:</label>
                    <input type="text" name="username" id="username" class="form-control" required>
                </div>
                <div class="mb-3">
                    <label for="password" class="form-label">Password:</label>
                    <input type="password" name="password" id="password" class="form-control" required>
                </div>
                <div class="mb-3">
                    <label for="confirmPassword" class="form-label">Confirm Password:</label>
                    <input type="password" name="confirmPassword" id="confirmPassword" class="form-control" required>
                </div>
                <div class="mb-3">
                    <label class="form-label">Gender:</label>
                    <div class="form-check">
                        <input type="radio" name="gender" id="male" class="form-check-input" value="male" required>
                        <label for="male" class="form-check-label">Male</label>
                    </div>
                    <div class="form-check">
                        <input type="radio" name="gender" id="female" class="form-check-input" value="female" required>
                        <label for="female" class="form-check-label">Female</label>
                    </div>
                    <div class="form-check">
                        <input type="radio" name="gender" id="other" class="form-check-input" value="other" required>
                        <label for="other" class="form-check-label">Other</label>
                    </div>
                </div>
                <button type="submit" class="btn btn-primary">Register</button>
            </form>

            <%-- Display registration errors --%>
            <c:if test="${not empty registrationError}">
                <p style="color: red;">${registrationError}</p>
            </c:if>
            <div class="mt-3">
                <p>If you already have an account, <a href="${pageContext.request.contextPath}/login">login here</a>.</p>
            </div>
        </div>

        <!-- Include Bootstrap 5.3 JS -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
