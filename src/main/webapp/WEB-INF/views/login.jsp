<%-- 
    Document   : login
    Created on : Jul 30, 2023, 5:06:50 PM
    Author     : Phuc Anh
--%>

<!DOCTYPE html>
<html>
<head>
    <title>Login</title>
</head>
<body>
    <h1>Login</h1>
    <c:if test="${not empty error}">
        <p style="color: red;">${error}</p>
    </c:if>
    <form action="${pageContext.request.contextPath}/login" method="post">
        <label for="username">Username:</label>
        <input type="text" name="username" id="username" required/><br/>
        <label for="password">Password:</label>
        <input type="password" name="password" id="password" required/><br/>
        <input type="submit" value="Login"/>
    </form>
</body>
</html>