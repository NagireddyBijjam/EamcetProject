package com.eamcet.servlet;

import com.eamcet.model.Student;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;
import java.io.*;
import java.util.*;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
    private static Map<String, Student> studentMap = new HashMap<>();
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String mobile = request.getParameter("mobile");
        
        // Basic validation
        if (name == null || name.trim().isEmpty() || 
            email == null || email.trim().isEmpty() || 
            password == null || password.trim().isEmpty()) {
            
            request.setAttribute("errorMessage", "All fields are required!");
            request.getRequestDispatcher("register.jsp").forward(request, response);
            return;
        }
        
        // Check if email already exists
        if (studentMap.containsKey(email)) {
            request.setAttribute("errorMessage", "Email already registered!");
            request.getRequestDispatcher("register.jsp").forward(request, response);
            return;
        }
        
        // Create new student
        Student student = new Student(name, email, password);
        student.setMobile(mobile);
        
        // Store in memory
        studentMap.put(email, student);
        
        // Set success message
        request.setAttribute("successMessage", "Registration successful! Please login.");
        request.getRequestDispatcher("login.jsp").forward(request, response);
    }
    
    // Helper method to validate login
    public static Student validateLogin(String email, String password) {
        Student student = studentMap.get(email);
        if (student != null && student.getPassword().equals(password)) {
            return student;
        }
        return null;
    }
}