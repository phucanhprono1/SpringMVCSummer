<%-- 
    Document   : productHistory
    Created on : Jul 29, 2023, 11:00:53 PM
    Author     : ducan
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>History</title>
</head>
<body>
    <jsp:include page="/WEB-INF/views/navbar.jsp" />
    <h1>Product History for ${product.name}</h1>
    <table class="table table-hover table-responsive-md">
        <tr>
            <th>ID</th>
            <th>New Quantity</th>
            <th>Change Time</th>
        </tr>
        <c:forEach items="${productHistory}" var="history">
            <tr>
                <td>${history.id}</td>
                <td>${history.newQuantity}</td>
                <td>${history.changeTime}</td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>
