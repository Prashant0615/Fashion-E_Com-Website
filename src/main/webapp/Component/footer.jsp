<%@ page contentType="text/html" pageEncoding="UTF-8" language="java" %>
<footer class="footer">
    <div class="footer-content">
        <p>&copy; <%= java.util.Calendar.getInstance().get(java.util.Calendar.YEAR) %> ICONIC STYLES. All rights reserved.</p>
        <ul class="footer-links">
            <li><a href="terms.jsp">Terms of Service</a></li>
            <li><a href="privacy.jsp">Privacy Policy</a></li>
            <li><a href="contact.jsp">Contact Us</a></li>
        </ul>
    </div>
</footer>

<style>
    .footer {
        background-color: #0A2558;
        color: white;
        text-align: center;
        padding: 20px 0;
        position: relative;
        bottom: 0;
        width: 100%;
    }

    .footer-content {
        max-width: 1200px;
        margin: 0 auto;
    }

    .footer-links {
        list-style: none;
        padding: 0;
    }

    .footer-links li {
        display: inline;
        margin: 0 15px;
    }

    .footer-links a {
        color: white;
        text-decoration: none;
    }

    .footer-links a:hover {
        text-decoration: underline;
    }
</style>
