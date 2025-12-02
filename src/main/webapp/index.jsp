<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>EAMCET Application Portal</title>
    <style>
        body { font-family: Arial; margin: 50px; background: #f0f2f5; }
        .container { max-width: 800px; margin: auto; background: white; padding: 30px; border-radius: 10px; box-shadow: 0 0 10px rgba(0,0,0,0.1); }
        h1 { color: #2c3e50; text-align: center; }
        .menu { display: flex; justify-content: center; gap: 20px; margin-top: 30px; }
        .btn { padding: 12px 24px; background: #3498db; color: white; text-decoration: none; border-radius: 5px; }
        .btn:hover { background: #2980b9; }
        .info-box { background: #e8f4fc; padding: 20px; margin: 20px 0; border-radius: 5px; }
    </style>
</head>
<body>
    <div class="container">
        <h1>🏫 EAMCET Application Portal</h1>
        
        <div class="info-box">
            <h3>Welcome to Engineering, Agriculture and Medical Common Entrance Test</h3>
            <p>Apply online for EAMCET examination. Please register if you are a new user or login to continue your application.</p>
        </div>
        
        <div class="menu">
            <a href="register.jsp" class="btn">📝 Register</a>
            <a href="login.jsp" class="btn">🔐 Login</a>
        </div>
        
        <div style="margin-top: 30px;">
            <h3>Important Information:</h3>
            <ul>
                <li>Registration is free for all candidates</li>
                <li>Keep your hall ticket number ready</li>
                <li>Have scanned documents prepared</li>
                <li>Application deadline: 30th April 2024</li>
            </ul>
        </div>
    </div>
</body>
</html>