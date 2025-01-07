<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Login</title>
    <%@include file="Component/common_css_js.jsp" %>
    <link rel="stylesheet" href="CSS/Login.css">
</head>
<body>
  
    <div class="wrapper">
        <div class="login-box">
            <h2>Login Here</h2>
            <% 
                // Display error messages if any
                String errorMessage = (String) request.getAttribute("errorMessage");
                if (errorMessage != null) { 
            %>
                <div class="alert">
                    <%= errorMessage %>
                </div>
            <% } %>
            <form action="LoginServlet" method="post">
                <div class="input-box">
                    <input name="email" type="email" required>
                    <label>Email</label>
                </div>
                <div class="input-box">
                    <input name="password" type="password" required>
                    <label>Password</label>
                </div>
                <div class="remember-forgot">
                    <label>
                        <input type="checkbox"> Remember me
                    </label>
                    
                </div>
                <div class="button-group">
                    <button type="submit">Submit</button>
                    <button type="reset">Reset</button>
                </div>
            </form>
            <div class="register-link">
                <p>Don't have an account? <a href="Register.jsp">Register here!</a></p>
            </div>
        </div>
    </div>
</body>
</html>
