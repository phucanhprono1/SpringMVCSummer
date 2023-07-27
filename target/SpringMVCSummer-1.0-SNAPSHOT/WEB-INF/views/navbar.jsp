<%-- 
    Document   : navbar
    Created on : Jul 25, 2023, 11:59:45 PM
    Author     : ducan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <!-- Add Bootstrap CSS -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">

        <!-- Add Bootstrap JS (Optional: If you need Bootstrap JavaScript features) -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
        <style>
            /* Navbar styling */
            .navbar {
                background-color: #000; /* Black background */
                color: #fff; /* White text */
                position: relative; /* To position the banner */
                padding-top: 30px; /* Adjust this value to set the space for the banner */
            }

            .navbar:hover {
                background-color: #333; /* Dark gray background on hover */
            }

            /* Banner styling */
            .navbar-banner {
                position: absolute;
                top: 0;
                left: 0;
                right: 0;
                height: 60px; /* Set the height of the banner as needed */
                background-color: #222; /* Dark gray background for the banner */
                display: flex;
                justify-content: center;
                align-items: center;
            }

            .navbar-banner-text {
                color: #fff; /* White text for the banner content */
                font-size: 18px; /* Adjust this value to set the font size */
            }
            /* Add a media query for small screens */
            @media (max-width: 767px) {
                .navbar .collapse {
                    display: none; /* Hide the menu by default on small screens */
                }

                .navbar .collapse.show {
                    display: block; /* Show the menu when the toggle button is clicked */
                }
            }
        </style>

    </head>
    <body>
        <!-- Navbar with banner -->
        <div class="navbar-banner">
            <div class="navbar-banner-text">Your Banner Content Goes Here</div>
        </div>

        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <div class="container">
                <a class="navbar-brand" href="${pageContext.request.contextPath}/admin"></a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav"
                        aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav">
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
                        <!-- Add more menu items as needed -->
                    </ul>
                </div>
            </div>
        </nav>
        <script>
            // JavaScript code to handle navbar toggle on small screens
            document.addEventListener("DOMContentLoaded", function () {
                const navbarToggle = document.querySelector(".navbar .navbar-toggler");
                const navbarCollapse = document.querySelector(".navbar .collapse");

                navbarToggle.addEventListener("click", function () {
                    navbarCollapse.classList.toggle("show");
                });
            });
        </script>

    </body>

</html>
