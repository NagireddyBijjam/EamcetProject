<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login - EAMCET</title>
    <style>
        body { font-family: Arial; margin: 50px; background: #f0f2f5; }
        .container { max-width: 400px; margin: auto; background: white; padding: 30px; border-radius: 10px; box-shadow: 0 0 10px rgba(0,0,0,0.1); }
        h2 { color: #2c3e50; text-align: center; }
        input[type=text], input[type=password], input[type=email] { 
            width: 100%; padding: 10px; margin: 8px 0; border: 1px solid #ddd; border-radius: 4px; 
        }
        input[type=submit] { 
            background: #3498db; color: white; padding: 12px; border: none; border-radius: 4px; 
            width: 100%; cursor: pointer; font-size: 16px; margin-top: 10px;
        }
        input[type=submit]:hover { background: #2980b9; }
        .error { color: #e74c3c; background: #fadbd8; padding: 10px; border-radius: 4px; }
        .link { text-align: center; margin-top: 20px; }
    </style>
</head>
<body>
    <div class="container">
        <h2>🔐 Student Login</h2>
        
        <% if(request.getAttribute("errorMessage") != null) { %>
            <div class="error"><%= request.getAttribute("errorMessage") %></div>
        <% } %>
        
        <% if(request.getAttribute("successMessage") != null) { %>
            <div class="success"><%= request.getAttribute("successMessage") %></div>
        <% } %>
        
        <form action="login" method="post">
            <label>Email Address</label>
            <input type="email" name="email" required>
            
            <label>Password</label>
            <input type="password" name="password" required>
            
            <input type="submit" value="Login">
        </form>
        
        <div class="link">
            New user? <a href="register.jsp">Register here</a> | 
            <a href="index.jsp">Back to Home</a>
        </div>
    </div>
</body>
</html>