<%-- 
    Document   : productForm
    Created on : Jul 16, 2023, 8:24:52 PM
    Author     : ducan
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Add or Update Product</title>
    </head>
    <body>
        <h1>Add or Update Product</h1>
        <form action="${pageContext.request.contextPath}/product/addOrUpdate" method="POST">
            <label for="name">Name:</label>
            <input type="text" name="name" id="name" required><br>

            <label for="price">Price:</label>
            <input type="number" name="price" id="price" required><br>

            <label for="color">Color:</label>
            <input type="text" name="color" id="color" required><br>

            <label for="description">Description:</label>
            <textarea name="description" id="description" rows="4" cols="50"></textarea><br>

            <label for="image">Image:</label>
            <input type="text" name="image" id="image" required><br>

            <label for="size">Size:</label>
            <input type="text" name="size" id="size" required><br>

            <label for="manufacturer">Manufacturer:</label>
            <input type="text" name="manufacturer" id="manufacturer" required><br>

            <label for="quantity">Quantity:</label>
            <input type="number" name="quantity" id="quantity" required><br>

            <label for="numberSell">Number Sold:</label>
            <input type="number" name="numberSell" id="numberSell" required><br>

            <label for="adminId">Admin ID:</label>
            <input type="text" name="adminId" id="adminId" required><br>

            <button type="submit">Save</button>
        </form>
    </body>
</html>