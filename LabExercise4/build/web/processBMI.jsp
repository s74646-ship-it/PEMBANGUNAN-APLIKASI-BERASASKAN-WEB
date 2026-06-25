<%-- 
    Document   : processBMI
    Created on : 21 Apr 2026, 4:45:56 pm
    Author     : flora
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="style.css">
    </head>
    <body>
        <%
            String weightStr = request.getParameter("weight");
            String heightStr = request.getParameter("height");

            double weight = 0;
            double height = 0;
            double bmi = 0;
            String category = "";

            try {
                weight = Double.parseDouble(weightStr);
                height = Double.parseDouble(heightStr);

                if (height == 0) {
                    out.println("Error: Height cannot be zero!");
                    return;
                }

                bmi = weight / (height * height);

                if (bmi < 18.5) {
                    category = "Underweight";
                } else if (bmi <= 25) {
                    category = "Normal";
                } else {
                    category = "Overweight";
                }

            } catch (Exception e) {
                out.println("Error: Please enter valid numeric values.");
                return;
            }
        %>

        <jsp:forward page="resultBMI.jsp">
            <jsp:param name="bmi" value="<%= bmi %>" />
            <jsp:param name="category" value="<%= category %>" />
        </jsp:forward>
    </body>
</html>
