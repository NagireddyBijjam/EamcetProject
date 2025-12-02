<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    // Check if user is logged in
    if(session.getAttribute("email") == null) {
        response.sendRedirect("login.jsp");
        return;
    }
    
    String email = (String) session.getAttribute("email");
    Object studentObj = session.getAttribute("student");
    
    // Get application from session - renamed from "application" to avoid conflict
    java.util.Map<String, String> appData = 
        (java.util.Map<String, String>) session.getAttribute("application");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Dashboard - EAMCET</title>
    <style>
        body { font-family: Arial; margin: 20px; background: #f0f2f5; }
        .header { background: #2c3e50; color: white; padding: 20px; border-radius: 10px; }
        .container { max-width: 1000px; margin: auto; }
        .card { background: white; padding: 20px; margin: 20px 0; border-radius: 10px; box-shadow: 0 0 5px rgba(0,0,0,0.1); }
        .btn { padding: 10px 20px; background: #3498db; color: white; text-decoration: none; border-radius: 5px; display: inline-block; margin: 5px; }
        .btn:hover { opacity: 0.9; }
        .btn-success { background: #2ecc71; }
        .btn-logout { background: #e74c3c; }
        .info-grid { display: grid; grid-template-columns: repeat(2, 1fr); gap: 15px; }
        .status { padding: 5px 10px; border-radius: 20px; font-weight: bold; }
        .status-submitted { background: #d4efdf; color: #27ae60; }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <h1>👤 Student Dashboard</h1>
            <p>Welcome, <%= email %></p>
            <a href="index.jsp" class="btn">🏠 Home</a>
            <a href="application.jsp" class="btn btn-success">📄 New Application</a>
            <a href="login.jsp" class="btn btn-logout">🚪 Logout</a>
        </div>
        
        <% if(request.getAttribute("successMessage") != null) { %>
            <div class="card" style="background: #d4efdf; color: #27ae60;">
                <h3>✅ <%= request.getAttribute("successMessage") %></h3>
                <% if(request.getAttribute("applicationId") != null) { %>
                    <p>Application ID: <strong><%= request.getAttribute("applicationId") %></strong></p>
                <% } %>
            </div>
        <% } %>
        
        <div class="card">
            <h2>📋 Application Status</h2>
            <% if(appData != null && !appData.isEmpty()) { %>
                <div class="info-grid">
                    <div><strong>Exam Year:</strong> <%= appData.get("examYear") %></div>
                    <div><strong>Exam Type:</strong> <%= appData.get("examType") %></div>
                    <div><strong>Status:</strong> <span class="status status-submitted"><%= appData.get("status") %></span></div>
                </div>
            <% } else { %>
                <p>No application submitted yet.</p>
                <a href="application.jsp" class="btn btn-success">Submit Your First Application</a>
            <% } %>
        </div>
        
        <div class="card">
            <h2>📝 Quick Actions</h2>
            <a href="application.jsp" class="btn">📄 Apply for EAMCET</a>
            <a href="#" class="btn">📄 Download Hall Ticket</a>
            <a href="#" class="btn">📊 Check Results</a>
        </div>
    </div>
</body>
</html>