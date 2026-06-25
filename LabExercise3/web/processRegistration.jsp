<%-- 
    Document   : processRegistration
    Created on : 25 Jun 2026, 11:58:18 pm
    Author     : flora
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%@include file="header.jsp" %>

        <h3>Registration Successful!</h3>
        <%
            String name = request.getParameter("studentName");
            String matric = request.getParameter("matricNum");
            String club = request.getParameter("clubName");
        %>

        <p>Thank you for registering. Here are your details:</p>
        <ul>
            <li><b>Name:</b> <%= name %></li>
            <li><b>Matric Number:</b> <%= matric %></li>
            <li><b>Club Joined:</b> <%= club %></li>
        </ul>

        <%@include file="footer.jsp" %>
    </body>
</html>
