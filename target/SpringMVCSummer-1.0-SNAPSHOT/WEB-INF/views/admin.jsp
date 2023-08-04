<%-- 
    Document   : admin
    Created on : Jul 27, 2023, 11:06:18 PM
    Author     : ducan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin</title>
    </head>
    <body>
        
        <jsp:include page="/WEB-INF/views/navbar.jsp" />
        <h1>Welcome ${admin.name}</h1>
    </body>
</html>
