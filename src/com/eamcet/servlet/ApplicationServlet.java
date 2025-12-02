package com.eamcet.servlet;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;
import java.io.*;
import java.util.*;

@WebServlet("/apply")
public class ApplicationServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        HttpSession session = request.getSession(false);
        
        // Check if user is logged in
        if (session == null || session.getAttribute("email") == null) {
            response.sendRedirect("login.jsp");
            return;
        }
        
        String email = (String) session.getAttribute("email");
        String examYear = request.getParameter("examYear");
        String examType = request.getParameter("examType");
        String category = request.getParameter("category");
        String qualifyingExam = request.getParameter("qualifyingExam");
        String marksObtained = request.getParameter("marksObtained");
        String totalMarks = request.getParameter("totalMarks");
        
        // Validate required fields
        if (examYear == null || examYear.trim().isEmpty() || 
            examType == null || examType.trim().isEmpty()) {
            
            request.setAttribute("errorMessage", "Exam Year and Type are required!");
            request.getRequestDispatcher("application.jsp").forward(request, response);
            return;
        }
        
        // Store application details
        Map<String, String> appDetails = new HashMap<>();
        appDetails.put("examYear", examYear);
        appDetails.put("examType", examType);
        appDetails.put("category", category != null ? category : "");
        appDetails.put("qualifyingExam", qualifyingExam != null ? qualifyingExam : "");
        appDetails.put("marksObtained", marksObtained != null ? marksObtained : "");
        appDetails.put("totalMarks", totalMarks != null ? totalMarks : "");
        appDetails.put("applicationDate", new Date().toString());
        appDetails.put("status", "Submitted");
        
        // Store in session
        session.setAttribute("application", appDetails);
        
        // Set success message
        request.setAttribute("successMessage", "Application submitted successfully!");
        request.setAttribute("applicationId", "EAMCET" + System.currentTimeMillis());
        request.getRequestDispatcher("application.jsp").forward(request, response);
    }
}