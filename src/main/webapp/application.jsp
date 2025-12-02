<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    // Check if user is logged in
    if(session.getAttribute("email") == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Apply - EAMCET</title>
    <style>
        body { font-family: Arial; margin: 50px; background: #f0f2f5; }
        .container { max-width: 600px; margin: auto; background: white; padding: 30px; border-radius: 10px; box-shadow: 0 0 10px rgba(0,0,0,0.1); }
        h2 { color: #2c3e50; text-align: center; }
        input, select { 
            width: 100%; padding: 10px; margin: 8px 0; border: 1px solid #ddd; border-radius: 4px; 
        }
        input[type=submit] { 
            background: #2ecc71; color: white; padding: 12px; border: none; border-radius: 4px; 
            width: 100%; cursor: pointer; font-size: 16px; margin-top: 10px;
        }
        input[type=submit]:hover { background: #27ae60; }
        .error { color: #e74c3c; background: #fadbd8; padding: 10px; border-radius: 4px; }
        .link { text-align: center; margin-top: 20px; }
        .form-group { margin-bottom: 15px; }
    </style>
</head>
<body>
    <div class="container">
        <h2>📄 EAMCET Application Form</h2>
        
        <% if(request.getAttribute("errorMessage") != null) { %>
            <div class="error"><%= request.getAttribute("errorMessage") %></div>
        <% } %>
        
        <form action="apply" method="post">
            <div class="form-group">
                <label>Exam Year *</label>
                <select name="examYear" required>
                    <option value="">Select Year</option>
                    <option value="2024">2024</option>
                    <option value="2025">2025</option>
                    <option value="2026">2026</option>
                </select>
            </div>
            
            <div class="form-group">
                <label>Exam Type *</label>
                <select name="examType" required>
                    <option value="">Select Type</option>
                    <option value="Engineering">Engineering (E)</option>
                    <option value="Agriculture">Agriculture (A)</option>
                    <option value="Medical">Medical (M)</option>
                </select>
            </div>
            
            <div class="form-group">
                <label>Category</label>
                <select name="category">
                    <option value="">Select Category</option>
                    <option value="OC">OC</option>
                    <option value="BC-A">BC-A</option>
                    <option value="BC-B">BC-B</option>
                    <option value="BC-C">BC-C</option>
                    <option value="BC-D">BC-D</option>
                    <option value="BC-E">BC-E</option>
                    <option value="SC">SC</option>
                    <option value="ST">ST</option>
                </select>
            </div>
            
            <div class="form-group">
                <label>Qualifying Exam</label>
                <select name="qualifyingExam">
                    <option value="">Select Exam</option>
                    <option value="Intermediate">Intermediate/12th Class</option>
                    <option value="Diploma">Diploma</option>
                    <option value="Other">Other Equivalent</option>
                </select>
            </div>
            
            <div class="form-group">
                <label>Marks Obtained</label>
                <input type="number" name="marksObtained" step="0.01" placeholder="e.g., 95.5">
            </div>
            
            <div class="form-group">
                <label>Total Marks</label>
                <input type="number" name="totalMarks" step="0.01" placeholder="e.g., 100" value="100">
            </div>
            
            <input type="submit" value="Submit Application">
        </form>
        
        <div class="link">
            <a href="dashboard.jsp">Back to Dashboard</a> | 
            <a href="index.jsp">Home</a>
        </div>
        
        <div style="margin-top: 20px; padding: 15px; background: #e8f4fc; border-radius: 5px;">
            <h4>📋 Required Documents:</h4>
            <ul>
                <li>Hall Ticket Number</li>
                <li>Recent Passport Photo</li>
                <li>Signature</li>
                <li>Qualifying Exam Marks Memo</li>
            </ul>
        </div>
    </div>
</body>
</html>