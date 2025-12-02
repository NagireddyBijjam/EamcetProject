package com.eamcet.servlet;

import com.eamcet.model.Student;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;
import java.io.*;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        
        // Validate login
        Student student = RegisterServlet.validateLogin(email, password);
        
        if (student != null) {
            // Create session
            HttpSession session = request.getSession();
            session.setAttribute("student", student);
            session.setAttribute("email", email);
            
            // Redirect to application page
            response.sendRedirect("application.jsp");
        } else {
            request.setAttribute("errorMessage", "Invalid email or password!");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }
}