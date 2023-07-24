<%-- 
    Document   : home
    Created on : Jul 15, 2023, 9:15:29 AM
    Author     : ducan
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- home.jsp -->

<!DOCTYPE html>
<html>
<head>
    <title>Category and Product View</title>
</head>
<body>
    <h1>Categories</h1>
    <ul>
        <c:forEach var="category" items="${categories}">
            <li>
                <a href="<c:url value='/category/products' />?id=${category.id}">${category.name}</a>
            </li>
        </c:forEach>
    </ul>

    <hr>

    <h1>Products in Selected Category</h1>
    <c:if test="${not empty prodByCate}">
        <ul>
            <c:forEach var="product" items="${prodByCate}">
                <li>${product.name}</li>
            </c:forEach>
        </ul>
    </c:if>
</body>
</html>
