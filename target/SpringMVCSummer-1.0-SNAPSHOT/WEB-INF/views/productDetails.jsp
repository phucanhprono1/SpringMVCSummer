<%-- 
    Document   : productDetails
    Created on : Jul 25, 2023, 6:51:31 PM
    Author     : Phuc Anh
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">

<!DOCTYPE html>
<html>
    <head>
        <title>Product Details</title>
    </head>
    <body>
        <jsp:include page="navBarUser.jsp"/>
        <div class="container">
            <h2>Product Details</h2>
            <div class="card mb-3">
                <div class="row g-0">
                    <div class="col-md-4">
                        <img src="${product.image}" class="img-fluid" alt="${product.name}">
                    </div>
                    <div class="col-md-8">
                        <div class="card-body">
                            <h5 class="card-title">${product.name}</h5>
                            <p class="card-text">Price: ${product.price}</p>
                            <p class="card-text">Color: ${product.color}</p>
                            <p class="card-text">Description: ${product.description}</p>
                            <!-- Add more product information here if needed -->

                            <!-- Add to Cart button -->
                            <form action="${pageContext.request.contextPath}/cart/add/${product.id}" method="POST">
                                <label for="quantity">Quantity:</label>
                                <input type="number" id="quantity" name="quantity" value="1" min="1">
                                <button type="submit" class="btn btn-primary">Add to Cart</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>