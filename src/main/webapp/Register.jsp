<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>User Registration</title>
    <%@ include file="Component/common_css_js.jsp" %>
    <link rel="stylesheet" href="CSS/Register.css"> <!-- Link to a separate CSS file for registration -->
</head>
<body>

<div class="container">
    <h3 class="text-center my-2">Sign Up Here</h3>

    <% 
        String errorMessage = (String) request.getAttribute("errorMessage");
        String successMessage = (String) request.getAttribute("message");

        if (errorMessage != null) {
    %>
        <div class="message error">
            <h3>Errors:</h3>
            <p><%= errorMessage %></p>
        </div>
    <%
        }
        if (successMessage != null) {
    %>
        <div class="message success">
            <h3><%= successMessage %></h3>
        </div>
    <%
        }
    %>
    
    <form action="RegisterServlet" method="post" id="signup-form">
        <div class="form-group">
            <label for="name"></label>
            <input name="user_name" type="text" class="form-control" id="name" placeholder="Enter your name" required>
        </div>

        <div class="form-group">
            <label for="email"></label>
            <input name="user_email" type="email" class="form-control" id="email" placeholder="Enter your email" required>
        </div>

        <div class="form-group">
            <label for="password"></label>
            <input name="user_password" type="password" class="form-control" id="password" placeholder="Enter your password" required>
        </div>

        <div class="form-group">
            <label for="phone"></label>
            <input name="user_phone" type="tel" class="form-control" id="phone" placeholder="Enter your phone number" required>
        </div>

        <div class="form-group">
            <label for="address"></label>
            <textarea name="user_address" class="form-control" id="address" placeholder="Enter your address" required></textarea>
        </div>

        <div class="text-center">
            <button type="submit" class="btn btn-outline-success">Register</button>
            <button type="reset" class="btn btn-outline-warning">Reset</button>
        </div>
    </form>

    <div class="text-center">
        <a href="index.jsp">Back to Home</a>
    </div>
</div>

<!-- Include the Register.js file -->
<script src="JS/Register.js"></script>
</body>
</html>
