<%-- 
    Document   : processUser
    Created on : 12 May 2026, 4:40:33 pm
    Author     : flora
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
    <title>Process Registration</title>
</head>
<body>
    <h2>Registration Status</h2>
    <%
        // 1. Retrieve form data
        String uname = request.getParameter("username");
        String pass = request.getParameter("password");
        String fname = request.getParameter("firstname");
        String lname = request.getParameter("lastname");

        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            // 2. Load the database driver
            Class.forName("com.mysql.cj.jdbc.Driver");
            
            // 3. Create database connection (Update password if your XAMPP uses one)
            String url = "jdbc:mysql://localhost:3306/CSA3023";
            conn = DriverManager.getConnection(url, "root", "");

            // 4. Create PreparedStatement and execute
            String sql = "INSERT INTO userprofile (username, password, firstname, lastname) VALUES (?, ?, ?, ?)";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, uname);
            pstmt.setString(2, pass);
            pstmt.setString(3, fname);
            pstmt.setString(4, lname);

            int rowsAffected = pstmt.executeUpdate();

            if (rowsAffected > 0) {
                out.println("<p style='color:green;'>Registration successful! You can now log in.</p>");
            } else {
                out.println("<p style='color:red;'>Registration failed. Please try again.</p>");
            }

        } catch (Exception e) {
            out.println("<p style='color:red;'>Error: " + e.getMessage() + "</p>");
        } finally {
            // 5. Close connection
            if (pstmt != null) pstmt.close();
            if (conn != null) conn.close();
        }
    %>
    <br>
    <a href="login.jsp">Click here to Login</a>
</body>
</html>