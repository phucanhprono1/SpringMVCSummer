<%-- 
    Document   : navbar
    Created on : Jul 25, 2023, 11:59:45 PM
    Author     : ducan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    </head>
    <body>


        <nav class="navbar navbar-expand-lg navbar-dark bg-dark static-top">
            <div class="container-fluid">
                <a class="navbar-brand" href="${pageContext.request.contextPath}/admin"></a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="#navbarSupportedContent"
                        aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                        <li class="nav-item active">
                            <a class="nav-link" href="${pageContext.request.contextPath}/admin">Home</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="${pageContext.request.contextPath}/admin-products">Products</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="${pageContext.request.contextPath}/admin-categories">Categories</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="${pageContext.request.contextPath}/admin-suppliers">Suppliers</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="${pageContext.request.contextPath}/admin-products/viewAllProductHistory">Product History</a>
                        </li>
                    </ul>
                    <ul class="navbar-nav ml-auto"> <!-- Align the links to the right -->
                        <c:choose>
                            <c:when test="${empty admin}">
                                <!-- Show login and register links if the user is not logged in -->
                                <li class="nav-item">
                                    <a class="nav-link" href="${pageContext.request.contextPath}/admin-login">Login</a>
                                </li>
                            </c:when>
                            <c:otherwise>
                                <!-- Show user name and logout link if the user is logged in -->
                                <li class="nav-item">
                                    <a class="nav-link">Welcome, ${admin.name}</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="${pageContext.request.contextPath}/admin-logout">Logout</a>
                                </li>
                            </c:otherwise>
                        </c:choose>
                    </ul>
                </div>
            </div>
        </nav>

    </body>

</html>
