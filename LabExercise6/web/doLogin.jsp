<%-- 
    Document   : doLogin
    Created on : 12 May 2026, 4:41:19 pm
    Author     : flora
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%
    String uname = request.getParameter("username");
    String pass = request.getParameter("password");

    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        String url = "jdbc:mysql://localhost:3306/CSA3023";
        conn = DriverManager.getConnection(url, "root", "");

        // Query to check if username and password match
        String sql = "SELECT * FROM userprofile WHERE username = ? AND password = ?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, uname);
        pstmt.setString(2, pass);

        rs = pstmt.executeQuery();

        if (rs.next()) {
            // Validation succeeds: Save details in session
            session.setAttribute("sessionUser", rs.getString("username"));
            session.setAttribute("sessionFName", rs.getString("firstname"));
            session.setAttribute("sessionLName", rs.getString("lastname"));
            
            // Redirect to main.jsp
            response.sendRedirect("main.jsp");
        } else {
            // Validation fails: Redirect back to login with error message
            response.sendRedirect("login.jsp?msg=Invalid username or password..!");
        }

    } catch (Exception e) {
        out.println("Database connection error: " + e.getMessage());
    } finally {
        if (rs != null) rs.close();
        if (pstmt != null) pstmt.close();
        if (conn != null) conn.close();
    }
%>
