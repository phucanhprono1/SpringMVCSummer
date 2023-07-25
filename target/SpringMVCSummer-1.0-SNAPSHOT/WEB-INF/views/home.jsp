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
        <!-- Display all categories -->
        <h2>Categories:</h2>
        <ul>
            <c:forEach items="${categories}" var="category">
                <li>
                    <a href="category/products?id=${category.id}">
                        ${category.name}
                    </a>
                </li>
            </c:forEach>
        </ul>

        <!-- Display products by category -->
        <c:if test="${not empty prodByCate}">
            <h2>Products in this category:</h2>
            <table>
                <tr>
                    <th>Name</th>
                    <th>Price</th>
                    <th>Color</th>
                    <th>Description</th>
                    <!-- Add more columns as needed -->
                </tr>
                <c:forEach items="${prodByCate}" var="product">
                    <tr>
                        <td>${product.name}</td>
                        <td>${product.price}</td>
                        <td>${product.color}</td>
                        <td>${product.description}</td>
                        <!-- Add more cells as needed -->
                    </tr>
                </c:forEach>
            </table>
        </c:if>
    </body>
</html>
