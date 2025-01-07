<%@ page import="com.user.entities.User" %>
<%@ page import="com.user.entities.Category" %>
<%@ page import="com.user.entities.Product" %>
<%@ page import="java.util.List" %>
<%@ page import="com.user.DAO.UserDao" %>
<%@ page import="com.user.DAO.CategoryDao" %>
<%@ page import="com.user.DAO.ProductDao" %>
<%@ page import="com.user.helper.FactoryProvider" %>
<%@ page contentType="text/html" pageEncoding="UTF-8" %>

<%
    User user = (User) session.getAttribute("user");
    if (user == null) {
        session.setAttribute("message", "Login first");
        response.sendRedirect("Login.jsp");
        return;
    } else if ("normal".equals(user.getUserType())) {
        session.setAttribute("message", "You are not admin of this website");
        response.sendRedirect("Login.jsp");
        return;
    }
 
    // Fetch users, categories, and products from the database
    List<User> users = new UserDao(FactoryProvider.getfactory()).getAllUsers();
    List<Category> categories = new CategoryDao(FactoryProvider.getfactory()).getAllCategories();
    List<Product> products = new ProductDao(FactoryProvider.getfactory()).getAllProducts();
    
    
    
    

    // Example of how to retrieve counts; ensure these DAO methods exist
    
        
%>


<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Admin Panel</title>
        <%@ include file="Component/common_css_js.jsp" %>
        <%@include file="Component/message.jsp" %>
        <link rel="stylesheet" href="style.css">
        <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>
        <style>
            /* Custom styles for the admin panel */
            body {
                font-family: 'Arial', sans-serif;
                background-color: #f4f4f4; /* Light background for better contrast */
                color: #333;
            }

            .sidebar {
                width: 250px;
                height: 100%;
                background: #2d2d2d;
                position: fixed;
                transition: all 0.5s ease;
                box-shadow: 2px 0 5px rgba(0, 0, 0, 0.2);
            }

            .sidebar .logo-details {
                height: 60px;
                display: flex;
                align-items: center;
                padding: 0 20px;
            }

            .sidebar .logo-details i {
                font-size: 28px;
                color: #fff;
            }

            .sidebar .nav-links {
                margin-top: 20px;
            }

            .sidebar .nav-links li {
                position: relative;
            }

            .sidebar .nav-links li a {
                display: flex;
                align-items: center;
                text-decoration: none;
                padding: 10px 20px;
                color: #fff;
                transition: background 0.3s, padding-left 0.3s;
            }

            .sidebar .nav-links li a:hover {
                background: #1f1f1f;
                padding-left: 30px; /* Slightly indent on hover */
            }

            .home-section {
                margin-left: 250px;
                padding: 20px;
                transition: margin-left 0.5s;
            }

            .table {
                width: 100%;
                border-collapse: collapse;
                margin-top: 20px;
            }

            .table th, .table td {
                border: 1px solid #ddd;
                padding: 12px;
                text-align: left;
                transition: background-color 0.3s;
            }

            .table th {
                background-color: #007bff;
                color: white;
            }

            .table tr:hover {
                background-color: #f1f1f1; /* Highlight row on hover */
            }

            .modal-header {
                background-color: #007bff; /* Modal header background */
                color: white;
            }

            .modal-body {
                padding: 20px;
            }

            .btn-primary {
                background-color: #007bff;
                border-color: #007bff;
                transition: background-color 0.3s, transform 0.3s;
            }

            .btn-primary:hover {
                background-color: #0056b3; /* Darker shade on hover */
                transform: scale(1.05); /* Slightly grow button on hover */
            }

            /* Bold for labels */
            label {
                font-weight: bold; /* Make labels bold */
            }

            /* Responsive Adjustments */
            @media (max-width: 768px) {
                .sidebar {
                    width: 80px; /* Collapsed sidebar */
                }
                .sidebar .nav-links li a {
                    padding: 10px 15px;
                }
                .home-section {
                    margin-left: 80px; /* Adjust content margin */
                }
            }

            .welcome-message {
                display: none; /* Initially hidden */
                color: #007bff; /* Message color */
                font-size: 1.5em; /* Larger font size */
                margin-bottom: 20px; /* Space below the message */
            }

            .logout-button {
                position: absolute;
                bottom: 20px; /* Position at the bottom */
                left: 20px; /* Position from left */
                width: calc(100% - 40px); /* Full width minus padding */
                background-color: 608BC1; /* Bootstrap danger color */
                color: black; /* Text color */
                border: none; /* No border */
                padding: 10px; /* Padding */
                text-align: center; /* Center text */
                cursor: pointer; /* Pointer cursor */
                transition: background-color 0.3s; /* Transition for hover effect */
            }

            .logout-button:hover {
                background-color: #c82333; /* Darker shade on hover */
            }

            .profile-details {
                position: absolute;
                top: 10px; /* Position from top */
                right: 20px; /* Position from right */
                color: black; /* Text color */
            }
        </style>
    </head>
    <body>

        <div class="sidebar">
            <div class="logo-details">
                <i class='bx bxl-c-plus-plus'></i>
                <span class="logo_name text-white">Admin Panel</span>
            </div>
            <ul class="nav-links">

                <li><a href="Admin.jsp" class="active"><i class='bx bx-grid-alt'></i><span class="links_name">Dashboard</span></a></li>

                <li><a href="#" id="userButton"><i class='bx bx-user'></i><span class="links_name">Users</span></a></li>
                <li><a href="#" id="categoryButton"><i class='bx bx-list-ul'></i><span class="links_name">Categories</span></a></li>
                <li><a href="#" id="productButton"><i class='bx bx-box'></i><span class="links_name">Products</span></a></li>
                <li><a href="#" data-toggle="modal" data-target="#addProductModal"><i class='bx bx-plus'></i><span class="links_name">Add Product</span></a></li>
                <li><a href="#" data-toggle="modal" data-target="#addCategoryModal"><i class='bx bx-plus'></i><span class="links_name">Add Category</span></a></li>
            </ul>
            <button class="logout-button" onclick="window.location.href = 'index.jsp';">Log out</button> <!-- Logout Button -->
        </div>

        <section class="home-section">
            <nav>
                <div class="sidebar-button">
                    <i class='bx bx-menu sidebarBtn'></i>
                    <span class="dashboard text-center">ICONIC STYLES</span>
                </div>
                <div class="profile-details">
                    <span class="admin_name"><%= user.getName()%></span> <!-- User's name -->
                    <i class='bx bx-chevron-down'></i>
                </div>
            </nav>

            <div class="home-content">
                <div class="welcome-message" id="welcomeMessage">
                    <h1>Welcome I47</h1>
                    
                </div>

                <div id="dashboardSection" style="display: none;">
                    <h1>Welcome I47</h1>
                </div>

                <div id="userManagementSection" style="display: none;">
                    <h2>User Management</h2>
                    <table class="table table-bordered text-center">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Name</th>
                                <th>Email</th>
                                <th>User Type</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                for (User u : users) {
                            %>
                            <tr>
                                <td><%= u.getUserId()%></td>
                                <td><%= u.getName()%></td>
                                <td><%= u.getUserEmail()%></td>
                                <td><%= u.getUserType()%></td>
                            </tr>
                            <%
                                }
                            %>
                        </tbody>
                    </table>
                </div>

                <div id="categoryManagementSection" style="display: none;">
                    <h2>Category Management</h2>
                    <table class="table table-bordered">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Title</th>
                                <th>Description</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                for (Category c : categories) {
                            %>
                            <tr>
                                <td><%= c.getCategoryId()%></td>
                                <td><%= c.getCategoryTitle()%></td>
                                <td><%= c.getCategoryDescription()%></td>
                            </tr>
                            <%
                                }
                            %>
                        </tbody>
                    </table>
                </div>

                <div id="productManagementSection" style="display: none;">
                    <h2>Product Management</h2>
                    <table class="table table-bordered">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Name</th>
                                <th>Category</th>
                                <th>Price</th>
                                <th>Discount</th>
                                <th>Quantity</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                for (Product p : products) {
                            %>
                            <tr>
                                <td><%= p.getPId()%></td>
                                <td><%= p.getpName()%></td>
                                <td><%= p.getCategory().getCategoryTitle()%></td>
                                <td><%= p.getpPrice()%></td>
                                <td><%= p.getpDiscount()%></td>
                                <td><%= p.getpQuantity()%></td>
                            </tr>
                            <%
                                }
                            %>
                        </tbody>
                    </table>
                </div>
            </div>
        </section>

        <!-- Add Product Modal -->
        <div class="modal fade" id="addProductModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Add Product</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form action="/mavenproject7/productServlet" method="post" enctype="multipart/form-data">
                            <input type="hidden" name="Open" value="Add Product">
                            <div class="mb-3">
                                <label for="productName" class="form-label">Product Name</label>
                                <input type="text" class="form-control" id="productName" name="productName" required>
                            </div>
                            <div class="mb-3">
                                <label for="productDescription" class="form-label">Product Description</label>
                                <textarea class="form-control" id="productDescription" name="productDescription" rows="3" required></textarea>
                            </div>
                            <div class="mb-3">
                                <label for="productPrice" class="form-label">Price</label>
                                <input type="number" class="form-control" id="productPrice" name="productPrice" step="0.01" required>
                            </div>
                            <div class="mb-3">
                                <label for="productDiscount" class="form-label">Discount (%)</label>
                                <input type="number" class="form-control" id="productDiscount" name="productDiscount" min="0" max="100" required>
                            </div>
                            <div class="mb-3">
                                <label for="productQuantity" class="form-label">Quantity</label>
                                <input type="number" class="form-control" id="productQuantity" name="productQuantity" required>
                            </div>
                            <div class="mb-3">
                                <label for="productImage" class="form-label">Product Image</label>
                                <input type="file" class="form-control" id="productImage" name="productImage" accept="image/*" required>
                            </div>
                            <div class="mb-3">
                                <label for="productCategory" class="form-label">Category</label>
                                <select class="form-select" id="productCategory" name="categoryId" required>
                                    <option selected disabled>Select Category</option>
                                    <%
                                        for (Category c : categories) {
                                    %>
                                    <option value="<%= c.getCategoryId()%>"><%= c.getCategoryTitle()%></option>
                                    <%
                                        }
                                    %>
                                </select>
                            </div>
                            <button type="submit" class="btn btn-primary">Add Product</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <!-- Add Product Modal -->
        <div class="modal fade" id="addProductModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Add Product</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form action="/mavenproject7/productServlet" method="post" enctype="multipart/form-data">
                            <input type="hidden" name="Open" value="Add Product">
                            <div class="mb-3">
                                <label for="productName" class="form-label">Product Name</label>
                                <input type="text" class="form-control" id="productName" name="productName" required>
                            </div>
                            <div class="mb-3">
                                <label for="productDescription" class="form-label">Product Description</label>
                                <textarea class="form-control" id="productDescription" name="productDescription" rows="3" required></textarea>
                            </div>
                            <div class="mb-3">
                                <label for="productPrice" class="form-label">Price</label>
                                <input type="number" class="form-control" id="productPrice" name="productPrice" step="0.01" required>
                            </div>
                            <div class="mb-3">
                                <label for="productDiscount" class="form-label">Discount (%)</label>
                                <input type="number" class="form-control" id="productDiscount" name="productDiscount" min="0" max="100" required>
                            </div>
                            <div class="mb-3">
                                <label for="productQuantity" class="form-label">Quantity</label>
                                <input type="number" class="form-control" id="productQuantity" name="productQuantity" required>
                            </div>
                            <div class="mb-3">
                                <label for="productImage" class="form-label">Product Image</label>
                                <input type="file" class="form-control" id="productImage" name="productImage" accept="image/*" required>
                            </div>
                            <div class="mb-3">
                                <label for="productCategory" class="form-label">Category</label>
                                <select class="form-select" id="productCategory" name="categoryId" required>
                                    <option selected disabled>Select Category</option>
                                    <%
                                        for (Category c : categories) {
                                    %>
                                    <option value="<%= c.getCategoryId()%>"><%= c.getCategoryTitle()%></option>
                                    <%
                                        }
                                    %>
                                </select>
                            </div>
                            <button type="submit" class="btn btn-primary">Add Product</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <!-- Add Product Modal -->
        <div class="modal fade" id="addProductModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Add Product</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form action="/mavenproject7/productServlet" method="post" enctype="multipart/form-data">
                            <input type="hidden" name="Open" value="Add Product">
                            <div class="mb-3">
                                <label for="productName" class="form-label">Product Name</label>
                                <input type="text" class="form-control" id="productName" name="productName" required>
                            </div>
                            <div class="mb-3">
                                <label for="productDescription" class="form-label">Product Description</label>
                                <textarea class="form-control" id="productDescription" name="productDescription" rows="3" required></textarea>
                            </div>
                            <div class="mb-3">
                                <label for="productPrice" class="form-label">Price</label>
                                <input type="number" class="form-control" id="productPrice" name="productPrice" step="0.01" required>
                            </div>
                            <div class="mb-3">
                                <label for="productDiscount" class="form-label">Discount (%)</label>
                                <input type="number" class="form-control" id="productDiscount" name="productDiscount" min="0" max="100" required>
                            </div>
                            <div class="mb-3">
                                <label for="productQuantity" class="form-label">Quantity</label>
                                <input type="number" class="form-control" id="productQuantity" name="productQuantity" required>
                            </div>
                            <div class="mb-3">
                                <label for="productImage" class="form-label">Product Image</label>
                                <input type="file" class="form-control" id="productImage" name="productImage" accept="image/*" required>
                            </div>
                            <div class="mb-3">
                                <label for="productCategory" class="form-label">Category</label>
                                <select class="form-select" id="productCategory" name="categoryId" required>
                                    <option selected disabled>Select Category</option>
                                    <%
                                        for (Category c : categories) {
                                    %>
                                    <option value="<%= c.getCategoryId()%>"><%= c.getCategoryTitle()%></option>
                                    <%
                                        }
                                    %>
                                </select>
                            </div>
                            <button type="submit" class="btn btn-primary">Add Product</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <!-- Add Category Modal -->
        <div class="modal fade" id="addCategoryModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Add Category</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form action="ProductOperationServlet" method="post">

                            <%-- declare operation to fetch data --%>


                            <input type="hidden" name="operation" value="Add Category">


                            <div class="mb-3">

                                <label for="categoryTitle" class="form-label">Category Title</label>
                                <input type="text" class="form-control" id="categoryTitle" name="categoryTitle" required>
                            </div>
                            <div class="mb-3">
                                <label for="categoryDescription" class="form-label">Category Description</label>
                                <textarea class="form-control" id="categoryDescription" name="categoryDescription" rows="3" required></textarea>
                            </div>
                            <button type="submit" class="btn btn-primary">Add Category</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <script src="script.js"></script>
        <script>
                // Show welcome message and hide after 3 seconds
                document.getElementById("welcomeMessage").style.display = "block";
                setTimeout(function () {
                    document.getElementById("welcomeMessage").style.display = "none";
                }, 3000);

                // Show/hide sections based on clicked button
                document.getElementById("userButton").onclick = function () {
                    document.getElementById("userManagementSection").style.display = "block";
                    document.getElementById("categoryManagementSection").style.display = "none";
                    document.getElementById("productManagementSection").style.display = "none";
                };

                document.getElementById("categoryButton").onclick = function () {
                    document.getElementById("userManagementSection").style.display = "none";
                    document.getElementById("categoryManagementSection").style.display = "block";
                    document.getElementById("productManagementSection").style.display = "none";
                };

                document.getElementById("productButton").onclick = function () {
                    document.getElementById("userManagementSection").style.display = "none";
                    document.getElementById("categoryManagementSection").style.display = "none";
                    document.getElementById("productManagementSection").style.display = "block";
                };
                // Function to hide message after 3 seconds


        </script>





    </body>
</html>
