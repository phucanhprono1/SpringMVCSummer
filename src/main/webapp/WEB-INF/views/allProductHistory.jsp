<%-- 
    Document   : allProductHistory
    Created on : Jul 29, 2023, 11:28:04 AM
    Author     : ducan
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Product History</title>
        <meta charset="UTF-8">
    </head>
    <body>
        <jsp:include page="/WEB-INF/views/navbar.jsp" />
        <h1>All Product History</h1>
        <table class="table table-hover table-responsive-md">
            <tr>
                <th>ID</th>
                <th>Product Name</th>
                <th>New Quantity</th>
                <th>Change Time</th>
            </tr>
            <c:forEach items="${allProductHistory}" var="history">
                <tr>
                    <td>${history.id}</td>
                    <td>${history.product.name}</td>
                    <td>${history.newQuantity}</td>
                    <td>${history.changeTime}</td>
                </tr>
            </c:forEach>
        </table>
        <br>
        <a href="${pageContext.request.contextPath}/admin-products" class="btn btn-outline-primary">Back to Product List</a>
    </body>
</html>
