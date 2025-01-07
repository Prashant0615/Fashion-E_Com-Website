package com.user.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.user.DAO.UserDao;
import com.user.entities.User;
import com.user.helper.FactoryProvider;

public class LoginServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession httpSession = request.getSession();
        
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        // Basic validation
        if (email == null || email.isEmpty()) {
            httpSession.setAttribute("message", "Email cannot be empty.");
            response.sendRedirect("Login.jsp");
            return;
        }
        if (password == null || password.isEmpty()) {
            httpSession.setAttribute("message", "Password cannot be empty.");
            response.sendRedirect("Login.jsp");
            return;
        }

        UserDao userDao = new UserDao(FactoryProvider.getfactory());
        User user = userDao.getUserByEmailAndPassword(email, password);

        // Debugging output for user type
        if (user != null) {
            System.out.println("User Type: " + user.getUserType()); // Debug output

            // Successful login
            httpSession.setAttribute("user", user);
            httpSession.setAttribute("welcomeMessage", "Welcome " + user.getUserName() + "!");

            // Check user type and redirect accordingly
            if (user.getUserType().equalsIgnoreCase("Admin")) {
                response.sendRedirect("Admin.jsp");
            } else if (user.getUserType().equalsIgnoreCase("Normal")) {
                response.sendRedirect("Shop.jsp");
            } else {
                // Handle unexpected user types
                httpSession.setAttribute("message", "Unrecognized user type.");
                response.sendRedirect("Login.jsp");
            }
        } else {
            // Handle invalid login
            httpSession.setAttribute("message", "Invalid details. Try another email.");
            response.sendRedirect("Login.jsp");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}

