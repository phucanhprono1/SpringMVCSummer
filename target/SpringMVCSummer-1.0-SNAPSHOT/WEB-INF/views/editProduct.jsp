<%-- 
    Document   : editProduct
    Created on : Jul 21, 2023, 9:34:52 PM
    Author     : ducan
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Edit Product</title>
        <meta charset="UTF-8">
    </head>
    <body>
        <!-- Navbar -->
        <jsp:include page="/WEB-INF/views/navbar.jsp" />
        <div class="container">
            

            
            <h1 class="mt-4 mb-4">Edit Product</h1>

            
            <form class="mt-3" action="${pageContext.request.contextPath}/admin-products/update" method="post">
                <input type="hidden" name="id" value="${product.id}">
                <input type="hidden" name="oldQuantity" value="${product.quantity}">
                <div class="form-group">
                    <label for="name">Name:</label>
                    <input type="text" class="form-control" name="name" value="${product.name}" required>
                </div>
                <div class="form-group">
                    <label for="price">Price:</label>
                    <input type="text" class="form-control" name="price" value="${product.price}" required>
                </div>
                <div class="form-group">
                    <label for="quantity">Quantity:</label>
                    <input type="text" class="form-control" name="quantity" value="${product.quantity}" required>
                </div>
                <div class="form-group">
                    <label for="category">Category:</label>
                    <select class="form-control" name="category.id" required>
                        <c:forEach items="${categories}" var="category">
                            <option value="${category.id}" ${product.category.id == category.id ? 'selected' : ''}>${category.name}</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="form-group">
                    <label for="supplier">Supplier:</label>
                    <select class="form-control" name="supplier.id" required>
                        <c:forEach items="${suppliers}" var="supplier">
                            <option value="${supplier.id}" ${product.supplier.id == supplier.id ? 'selected' : ''}>${supplier.name}</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="form-group">
                    <label for="color">Color:</label>
                    <input type="text" class="form-control" name="color" value="${product.color}">
                </div>
                <div class="form-group">
                    <label for="description">Description:</label>
                    <textarea class="form-control" name="description">${product.description}</textarea>
                </div>
                <div class="form-group">
                    <label for="image">Image:</label>
                    <input type="text" class="form-control" name="image" value="${product.image}">
                </div>
                <div class="form-group">
                    <label for="size">Size:</label>
                    <input type="text" class="form-control" name="size" value="${product.size}">
                </div>
                <div class="form-group">
                    <label for="gender">Gender:</label>
                    <select class="form-control" name="gender" required>
                        <option value="Male" ${product.gender == 'Male' ? 'selected' : ''}>Male</option>
                        <option value="Female" ${product.gender == 'Female' ? 'selected' : ''}>Female</option>
                        <option value="Unisex" ${product.gender == 'Unisex' ? 'selected' : ''}>Unisex</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="brand">Brand:</label>
                    <input type="text" class="form-control" name="brand" value="${product.brand}">
                </div>
                <div class="form-group">
                    <label for="numberSell">Number Sell:</label>
                    <input type="hidden" name="numberSell" value="${product.numberSell}">
                </div>
                <button type="submit" class="btn btn-primary">Save</button>
            </form>

            
            <a href="${pageContext.request.contextPath}/admin-products" class="btn btn-secondary mt-3">Back to List</a>
        </div>
    </body>
</html>

</html>

