<%-- 
    Document   : home
    Created on : Jul 15, 2023, 9:15:29 AM
    Author     : phucanh
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- Import Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom CSS styles for product cards and spacing -->
<style>
    .product-card {
        width: 200px; /* Adjust the width as needed */
        margin: 10px; /* Add a small gap between products */
    }

    .product-card img {
        max-width: 100%;
        height: auto;
    }

    /* Black Background with White Text */
    .navbar-dark .navbar-brand {
        color: #fff;
    }

    .navbar-dark .navbar-nav .nav-link {
        color: #fff;
    }

    .navbar-dark .navbar-nav .nav-link:hover {
        color: #ddd;
    }

    /* Add a background color to the active link */
    .navbar-dark .navbar-nav .nav-link.active {
        color: #000;
        background-color: #fff;
    }

    /* Customize the background color of the navigation bar */
    .navbar-dark {
        background-color: #000;
    }
</style>

<!DOCTYPE html>
<html>
    <head>
        <title>Fashion Shop</title>
        <meta name="viewport" content="width = device-width,initial-scale=1.0">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
        <jsp:include page="navBarUser.jsp"/>
        <!-- Display all categories as buttons -->
        <h2>Categories:</h2>
        <div class="btn-group" role="group" aria-label="Categories">
            <c:forEach items="${categories}" var="category">
                <a href="${pageContext.request.contextPath}/products?cid=${category.id}" class="btn btn-secondary ${category.id == selectedCategoryId ? 'active' : ''}">${category.name}</a>
            </c:forEach>
        </div>
        <c:choose>

            <c:when test="${not empty selectedCategoryName}">
                <h2>Category: ${selectedCategoryName}</h2>
                <div class="row">
                    <c:forEach items="${prodByCate}" var="product">
                        <!-- Your product card HTML here -->
                        <div class="col-md-2 mb-2">
                            <div class="card product-card">
                                <img src="${product.image}" class="card-img-top" alt="${product.name}">
                                <div class="card-body">
                                    <h5 class="card-title">${product.name}</h5>
                                    <p class="card-text">Price: ${product.price}</p>
                                    <!-- Add more product information here if needed -->
                                    <a href="/product/${product.id}" class="btn btn-primary">View Details</a>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </c:when>
            <c:otherwise>
                <!-- Show all products -->
                <div class="row">
                    <c:forEach items="${allproducts}" var="product">
                        <!-- Your product card HTML here -->
                        <div class="col-md-2 mb-2">
                            <div class="card product-card">
                                <img src="${product.image}" class="card-img-top" alt="${product.name}">
                                <div class="card-body">
                                    <h5 class="card-title">${product.name}</h5>
                                    <p class="card-text">Price: ${product.price}</p>
                                    <!-- Add more product information here if needed -->
                                    <a href="${pageContext.request.contextPath}/product/${product.id}" class="btn btn-primary">View Details</a>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </c:otherwise>
        </c:choose>

        <!-- Add JavaScript to handle category button clicks -->
        <script>
            const categoryButtons = document.querySelectorAll('.btn-group .btn');

            categoryButtons.forEach(button => {
                button.addEventListener('click', () => {
                    // Remove the 'active' class from all category buttons
                    categoryButtons.forEach(btn => btn.classList.remove('active'));

                    // Add the 'active' class to the clicked category button
                    button.classList.add('active');
                });
            });
        </script>
        <!-- Import Bootstrap JS -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>

