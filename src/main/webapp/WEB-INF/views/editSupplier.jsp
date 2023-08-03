<%-- 
    Document   : editSupplier
    Created on : Jul 21, 2023, 12:13:57 AM
    Author     : ducan
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <title>Edit Supplier</title>
        <meta charset="UTF-8">
    </head>
    <body>
        <jsp:include page="/WEB-INF/views/navbar.jsp" />
        <div class="container">

            <h1 class="mt-4 mb-4">Edit Supplier</h1>

            <form class="mt-3" action="${pageContext.request.contextPath}/admin-suppliers/update" method="post">
                <input type="hidden" name="id" value="${supplier.id}">
                <div class="form-group">
                    <label for="name">Name:</label>
                    <input type="text" class="form-control" name="name" value="${supplier.name}" required>
                </div>
                <div class="form-group">
                    <label for="address">Address:</label>
                    <input type="text" class="form-control" name="address" value="${supplier.address}">
                </div>
                <button type="submit" class="btn btn-primary">Save</button>
            </form>

            <a href="${pageContext.request.contextPath}/admin-suppliers" class="btn btn-secondary mt-3">Back to List</a>
        </div>


    </body>
</html>
