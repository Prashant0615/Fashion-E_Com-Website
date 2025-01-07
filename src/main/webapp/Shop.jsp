<%@page import="com.user.entities.Product"%>
<%@page import="com.user.helper.FactoryProvider"%>
<%@page import="com.user.helper.Helper"%>
<%@page import="java.util.List"%>
<%@page import="com.user.DAO.ProductDao"%>
<%@page import="com.user.DAO.CategoryDao"%>
<%@page import="com.user.entities.Category"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Shop</title>
    <%@include file="Component/common_css_js.jsp" %>  <!-- Common CSS & JS -->
    <link rel="stylesheet" href="CSS/Shop.css"> <!-- Your custom styles -->
</head>
<body>
    <%@include file="Component/Navbar.jsp" %> <!-- Include Navbar -->

    <div class="container mt-4">
        <div class="col-md-14">
            <div class="card mt-2">
                <div class="card-body">

                    <%
                        // Displaying welcome message if present
                        String welcomeMessage = (String) session.getAttribute("welcomeMessage");
                        if (welcomeMessage != null) { 
                    %>
                        <div id="welcomeMessage" class="alert alert-success">
                            <%= welcomeMessage %>
                        </div>
                        <% session.removeAttribute("welcomeMessage"); } %>

                    <div class="row">
                        <% 
                            // Handling search and category filter
                            String searchQuery = request.getParameter("searchQuery"); // Search Query from the form
                            String cat = request.getParameter("cate"); // Category filter

                            // Create product list based on search or category
                            ProductDao productDao = new ProductDao(FactoryProvider.getfactory());
                            List<Product> productList = null;

                            if (searchQuery != null && !searchQuery.trim().isEmpty()) {
                                // Search by name or description
                                productList = productDao.searchProductsByNameOrDesc(searchQuery);
                            } else if (cat == null || cat.trim().equals("all")) {
                                // Fetch all products if no category filter
                                productList = productDao.getAllProducts();
                            } else {
                                // Fetch products based on selected category
                                try {
                                    int categoryId = Integer.parseInt(cat);
                                    productList = productDao.getAllProductByID(categoryId);
                                } catch (NumberFormatException e) {
                                    out.println("<div class='alert alert-danger'>Invalid Category</div>");
                                }
                            }

                            // If products are available, display them
                            if (productList != null && !productList.isEmpty()) {
                                for (Product product : productList) {
                        %>
                                    <div class="col-md-3 mb-3">
                                        <div class="card">
                                            <img src="/Image/product/<%= product.getpPhoto() %>" class="card-img-top" alt="Product image">
                                            <div class="card-body">
                                                <h5 class="card-title"><%= product.getpName() %></h5>
                                                <p class="card-text"><%= Helper.getWord(product.getpDisc()) %></p>
                                            </div>
                                            <div class="footer text-center">
                                                <button class="btn custom-bg text-white" onclick="add_to_cart(<%= product.getPId()%>, '<%= product.getpName() %>' ,<%= product.getPriceAfterDiscount() %>)">Add to Cart</button>
                                                <button class="btn btn-success">$<%= product.getPriceAfterDiscount() %>/- <span> <%= product.getpPrice()%>/-<%= product.getpDiscount()%>% off </span></button>
                                            </div>
                                        </div>
                                    </div>
                                <% 
                                } 
                            } else {
                                // If no products found, display a warning
                                out.println("<div class='alert alert-warning'>No products found for this search or category.</div>");
                            }
                        %>
                    </div>
                </div>
            </div>
        </div>
    </div>

</body>
</html>
