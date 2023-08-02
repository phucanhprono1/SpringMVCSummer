<%-- 
    Document   : addProduct
    Created on : Jul 21, 2023, 9:58:21 PM
    Author     : ducan
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <title>Add Product</title>
        <style>
            body {
                font-family: Arial, sans-serif;
            }
            h1 {
                color: #007BFF;
                text-align: center;
            }
            h2 {
                text-align: center;
            }
            form {
                max-width: 500px;
                margin: 0 auto;
            }
            label {
                display: block;
                margin-bottom: 5px;
            }
            input[type="text"],
            input[type="number"],
            select,
            textarea {
                width: 100%;
                padding: 8px;
                margin-bottom: 15px;
                border: 1px solid #ccc;
                border-radius: 4px;
                box-sizing: border-box;
            }
            input[type="submit"] {
                background-color: #007BFF;
                color: #fff;
                border: none;
                padding: 10px 20px;
                border-radius: 4px;
                cursor: pointer;
            }
            input[type="submit"]:hover {
                background-color: #0056b3;
            }
            a {
                display: block;
                text-align: center;
                margin-top: 20px;
            }
            body {
                font-family: Arial, sans-serif;
                background-color: #f2f2f2;
            }

            h1 {
                color: #007BFF;
                text-align: center;
                margin: 30px 0;
            }

        </style>
    </head>
    <body>
        <jsp:include page="/WEB-INF/views/navbar.jsp" />
        <div style="text-align: center;">
            <h1>Add Product</h1>
        </div>
        <div style="margin: 0 auto; max-width: 600px;">
            <form action="${pageContext.request.contextPath}/admin-products/checkProduct" method="post">
                <label for="name">Product Name:</label>
                <input type="text" name="name" required>
                <br>
                <input type="submit" value="Check Product">
            </form>

            <c:if test="${existingProduct ne null}">
                <h2>Product already exists with the name: ${existingProduct.name}</h2>
                <h3>Current Quantity: ${existingProduct.quantity}</h3>
                <h3>Enter additional quantity to update:</h3>
                <form action="${pageContext.request.contextPath}/products/updateQuantity" method="post">
                    <input type="hidden" name="id" value="${existingProduct.id}">
                    <input type="hidden" name="oldQuantity" value="${existingProduct.quantity}">
                    <label for="quantity">Additional Quantity:</label>
                    <input type="number" name="quantity" required>
                    <br>
                    <input type="submit" value="Update Quantity">
                </form>
            </c:if>

            <c:if test="${existingProduct eq null}">
                <h2>Product does not exist. Add new product:</h2>
                <form action="${pageContext.request.contextPath}/admin-products/addNew" method="post">
                    <label for="name">Product Name:</label>
                    <input type="text" name="name" value="${param.name}" required readonly>
                    <br>
                    <label for="price">Price:</label>
                    <input type="number" name="price" required>
                    <br>
                    <label for="quantity">Quantity:</label>
                    <input type="number" name="quantity" required>
                    <br>
                    <label for="category">Category:</label>
                    <select name="category.id" required>
                        <c:forEach items="${categories}" var="cate">
                            <option value="${cate.id}">${cate.name}</option>
                        </c:forEach>
                    </select>
                    <br>
                    <label for="supplier">Supplier:</label>
                    <select name="supplier.id" required>
                        <c:forEach items="${suppliers}" var="spr">
                            <option value="${spr.id}">${spr.name}</option>
                        </c:forEach>
                    </select>
                    <br>
                    <c:set var="emptyList" value="[]" />
                    <input type="hidden" name="listComment" value="${emptyList}" />
                    <!-- Add other input fields for the product -->
                    <br>
                    <label for="color">Color:</label>
                    <input type="text" name="color">
                    <br>
                    <label for="description">Description:</label>
                    <textarea name="description"></textarea>
                    <br>
                    <label for="image">Image:</label>
                    <input type="text" name="image">
                    <br>
                    <label for="size">Size:</label>
                    <input type="text" name="size">
                    <br>
                    <label for="gender">Gender:</label>
                    <select name="gender" required>
                        <option value="Male">Male</option>
                        <option value="Female">Female</option>
                        <option value="Unisex">Unisex</option>
                    </select>
                    <br>
                    <label for="brand">Brand:</label>
                    <input type="text" name="brand">
                    <br>
                    <c:set var="initSell" value="0" />
                    <input type="hidden" name="numberSell" value="${initSell}" />
                    <br>
                    <input type="submit" value="Add Product">
                </form>
            </c:if>

            <br>
            <a href="${pageContext.request.contextPath}/admin-products" class="btn btn-outline-primary">Back to List</a>
        </div>

        
    </body>
</html>


