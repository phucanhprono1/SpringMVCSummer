<%-- 
    Document   : listSuppliers
    Created on : Jul 21, 2023, 12:12:51 AM
    Author     : ducan
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <title>Suppliers List</title>
</head>
<body>
    <jsp:include page="/WEB-INF/views/navbar.jsp" />
    <h1>Suppliers List</h1>
    <form action="${pageContext.request.contextPath}/suppliers/searchByName" method="get">
        <input type="text" name="name" placeholder="Enter supplier name">
        <input type="submit" value="Search">
    </form>
    <br>
    <table class="table table-hover table-responsive-md">
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Address</th>
            <th>Edit</th>
            <th>Delete</th>
        </tr>
        <c:forEach items="${suppliers}" var="supplier">
            <tr>
                <td>${supplier.id}</td>
                <td>${supplier.name}</td>
                <td>${supplier.address}</td>
                <td><a href="${pageContext.request.contextPath}/admin-suppliers/showEditForm?id=${supplier.id}" class="btn btn-info">Edit</a></td>
                <td><a href="${pageContext.request.contextPath}/admin-suppliers/showDeleteForm?id=${supplier.id}" class=" btn btn-danger">Delete</a></td>
            </tr>
        </c:forEach>
    </table>
    <br>
    <a href="${pageContext.request.contextPath}/admin-suppliers/showAddForm" class="btn btn-outline-primary">Add Supplier</a>
</body>
</html>
