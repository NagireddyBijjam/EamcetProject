<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Register - EAMCET</title>
    <style>
        body { font-family: Arial; margin: 50px; background: #f0f2f5; }
        .container { max-width: 500px; margin: auto; background: white; padding: 30px; border-radius: 10px; box-shadow: 0 0 10px rgba(0,0,0,0.1); }
        h2 { color: #2c3e50; text-align: center; }
        input[type=text], input[type=password], input[type=email] { 
            width: 100%; padding: 10px; margin: 8px 0; border: 1px solid #ddd; border-radius: 4px; 
        }
        input[type=submit] { 
            background: #2ecc71; color: white; padding: 12px; border: none; border-radius: 4px; 
            width: 100%; cursor: pointer; font-size: 16px; margin-top: 10px;
        }
        input[type=submit]:hover { background: #27ae60; }
        .error { color: #e74c3c; background: #fadbd8; padding: 10px; border-radius: 4px; }
        .success { color: #27ae60; background: #d4efdf; padding: 10px; border-radius: 4px; }
        .link { text-align: center; margin-top: 20px; }
    </style>
</head>
<body>
    <div class="container">
        <h2>📝 Student Registration</h2>
        
        <% if(request.getAttribute("errorMessage") != null) { %>
            <div class="error"><%= request.getAttribute("errorMessage") %></div>
        <% } %>
        
        <% if(request.getAttribute("successMessage") != null) { %>
            <div class="success"><%= request.getAttribute("successMessage") %></div>
        <% } %>
        
        <form action="register" method="post">
            <label>Full Name *</label>
            <input type="text" name="name" required>
            
            <label>Email Address *</label>
            <input type="email" name="email" required>
            
            <label>Password *</label>
            <input type="password" name="password" required>
            
            <label>Mobile Number</label>
            <input type="text" name="mobile">
            
            <input type="submit" value="Register">
        </form>
        
        <div class="link">
            Already registered? <a href="login.jsp">Login here</a> | 
            <a href="index.jsp">Back to Home</a>
        </div>
    </div>
</body>
</html>