<%-- 
    Document   : productForm
    Created on : Jul 16, 2023, 8:24:52 PM
    Author     : ducan
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Add or Update Product</title>
    </head>
    <body>
        <h1>Add or Update Product</h1>
        <label for="name">Name:</label>
        <input type="text" name="name" id="name" value="${product.name}" onkeyup="searchProduct()" />
        <label for="quantity">Quantity:</label>
        <c:choose>
            <c:when test="${productExists}">
                <input type="number" name="quantity" value="${quantityToInput}" />
            </c:when>
            <c:otherwise>
                <input type="number" name="quantity" style="display: none" />
            </c:otherwise>
        </c:choose>


        <script>
            function searchProduct() {
                var name = document.getElementById("name").value;

                if (name !== "") {
                    // Gửi yêu cầu AJAX để tìm kiếm sản phẩm
                    var xhr = new XMLHttpRequest();
                    xhr.open("GET", "http://localhost:8080/admin/search?name=" + name, true);
                    xhr.onreadystatechange = function () {
                        if (xhr.readyState === 4 && xhr.status === 200) {
                            var product = JSON.parse(xhr.responseText);

                            // Hiển thị các trường tương ứng
                            document.getElementById("price").style.display = "block";
                            document.getElementById("color").style.display = "block";
                            document.getElementById("description").style.display = "block";
                            document.getElementById("image").style.display = "block";
                            document.getElementById("size").style.display = "block";
                            document.getElementById("manufacturer").style.display = "block";

                            // Cập nhật các trường với thông tin sản phẩm tìm được
                            document.getElementById("price").value = product.price;
                            document.getElementById("color").value = product.color;
                            document.getElementById("description").value = product.description;
                            document.getElementById("image").value = product.image;
                            document.getElementById("size").value = product.size;
                            document.getElementById("manufacturer").value = product.manufacturer;
                        } else {
                            // Ẩn các trường nếu sản phẩm không được tìm thấy
                            document.getElementById("price").style.display = "none";
                            document.getElementById("color").style.display = "none";
                            document.getElementById("description").style.display = "none";
                            document.getElementById("image").style.display = "none";
                            document.getElementById("size").style.display = "none";
                            document.getElementById("manufacturer").style.display = "none";
                        }
                    };
                    xhr.send();
                } else {
                    // Ẩn các trường nếu không nhập tên sản phẩm
                    document.getElementById("price").style.display = "none";
                    document.getElementById("color").style.display = "none";
                    document.getElementById("description").style.display = "none";
                    document.getElementById("image").style.display = "none";
                    document.getElementById("size").style.display = "none";
                    document.getElementById("manufacturer").style.display = "none";
                }
            }
        </script>

    </body>
</html>