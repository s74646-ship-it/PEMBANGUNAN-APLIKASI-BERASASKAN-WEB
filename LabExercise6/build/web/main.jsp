<%-- 
    Document   : main
    Created on : 12 May 2026, 4:41:59 pm
    Author     : flora
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Main Dashboard</title>
</head>
<body>
    <%
        // Check if the user is actually logged in
        if (session.getAttribute("sessionUser") == null) {
            response.sendRedirect("login.jsp?msg=Please login first.");
        } else {
            String username = (String) session.getAttribute("sessionUser");
            String firstName = (String) session.getAttribute("sessionFName");
            String lastName = (String) session.getAttribute("sessionLName");
    %>
    
    <h2>Welcome to the System!</h2>
    <table border="1" cellpadding="5">
        <tr>
            <th>Username</th>
            <td><%= username %></td>
        </tr>
        <tr>
            <th>First Name</th>
            <td><%= firstName %></td>
        </tr>
        <tr>
            <th>Last Name</th>
            <td><%= lastName %></td>
        </tr>
    </table>
    
    <br><br>
    <%-- Optional: A simple logout mechanism --%>
    <a href="login.jsp" onclick="<% session.invalidate(); %>">Log Out</a>

    <%
        }
    %>
</body>
</html>