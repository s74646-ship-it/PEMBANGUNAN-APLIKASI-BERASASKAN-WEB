<%-- 
    Document   : registerClub
    Created on : 25 Jun 2026, 11:57:34 pm
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

        <h3>Club Registration Form</h3>
        <form action="processRegistration.jsp" method="POST">
            <p>Student Name: <input type="text" name="studentName" required></p>
            <p>Matric Number: <input type="text" name="matricNum" required></p>
            <p>Select Club: 
                <select name="clubName">
                    <option value="Computer Science Club">Computer Science Club</option>
                    <option value="Mathematics Club">Mathematics Club</option>
                    <option value="Robotics Society">Robotics Society</option>
                </select>
            </p>
            <p><input type="submit" value="Register Now"></p>
        </form>

        <%@include file="footer.jsp" %>
    </body>
</html>
