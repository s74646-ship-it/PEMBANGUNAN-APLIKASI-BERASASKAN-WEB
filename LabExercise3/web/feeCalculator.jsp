<%-- 
    Document   : feeCalculator
    Created on : 25 Jun 2026, 11:59:01 pm
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

        <h3>Membership Fee Calculator</h3>
        <p>Each activity costs RM10.00</p>

        <form method="GET">
            Number of Activities Joined: 
            <input type="number" name="activities" value="0" min="0" required>
            <input type="submit" value="Calculate Fee">
        </form>

        <br>
        <%
            String actStr = request.getParameter("activities");
            if (actStr != null) {
                int activities = Integer.parseInt(actStr);
                double totalFee = activities * 10.00;

                // Format to 2 decimal places
                String formattedFee = String.format("%.2f", totalFee);
        %>
                <h4>Calculation Result:</h4>
                <p>Total Fee to Pay: <b>RM <%= formattedFee %></b></p>
        <%
            }
        %>

        <%@include file="footer.jsp" %>
    </body>
</html>
