<%-- 
    Document   : memberDirectory
    Created on : 25 Jun 2026, 11:59:42 pm
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
        <%@page import="java.util.ArrayList"%>
        <%@include file="header.jsp" %>

        <h3>Club Committee Directory</h3>

        <%
            // Create and populate ArrayList
            ArrayList<String> committeeList = new ArrayList<String>();
            committeeList.add("Ahmad Fakhrul (President)");
            committeeList.add("Siti Nurhaliza (Vice President)");
            committeeList.add("Jason Lee (Secretary)");
            committeeList.add("Muthu Kumar (Treasurer)");
            committeeList.add("Nur Aisyah (Event Manager)");
        %>

        <p>Total Committee Members: <%= committeeList.size() %></p>

        <table border="1" cellpadding="5" cellspacing="0">
            <tr style="background-color: #ddd;">
                <th>No.</th>
                <th>Committee Member Name</th>
            </tr>
            <%
                // Loop through ArrayList to populate table rows
                for (int i = 0; i < committeeList.size(); i++) {
            %>
                <tr>
                    <td><%= (i + 1) %></td>
                    <td><%= committeeList.get(i) %></td>
                </tr>
            <%
                }
            %>
        </table>

        <%@include file="footer.jsp" %>
    </body>
</html>
