<%-- 
    Document   : register
    Created on : Jul 30, 2023, 5:43:50 PM
    Author     : Phuc Anh
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Registration</title>
</head>
<body>
    <h1>Registration</h1>
    <form action="${pageContext.request.contextPath}/register" method="post">
        <label>Email:</label>
        <input type="text" name="email" required><br>

        <label>Username:</label>
        <input type="text" name="username" required><br>

        <label>Password:</label>
        <input type="password" name="password" required><br>

        <label>Confirm Password:</label>
        <input type="password" name="confirmPassword" required><br>

        <label>Gender:</label>
        <input type="radio" name="gender" value="male" required> Male
        <input type="radio" name="gender" value="female" required> Female
        <input type="radio" name="gender" value="other" required> Other<br>

        <input type="submit" value="Register">
    </form>

    <%-- Display registration errors --%>
    <c:if test="${not empty registrationError}">
        <p style="color: red;">${registrationError}</p>
    </c:if>
</body>
</html>