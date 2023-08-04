<%-- 
    Document   : adminlogin
    Created on : Aug 3, 2023, 2:12:05 PM
    Author     : ducan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin login</title>
    </head>
    <body>
        <div class="container mt-4">
            <h1>Login</h1>
            <c:if test="${not empty error}">
                <p style="color: red;">${error}</p>
            </c:if>
            <form action="${pageContext.request.contextPath}/admin-login" method="post">
                <div class="mb-3">
                    <label for="name" class="form-label">Username:</label>
                    <input type="text" name="name" id="name" class="form-control" required/>
                </div>
                <div class="mb-3">
                    <label for="password" class="form-label">Password:</label>
                    <input type="password" name="password" id="password" class="form-control" required/>
                </div>
                <button type="submit" class="btn btn-primary">Login</button>
            </form>
            
        </div>

        <!-- Include Bootstrap 5.3 JS -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
