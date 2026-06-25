<%-- 
    Document   : resultBMI
    Created on : 21 Apr 2026, 4:48:22 pm
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
        <%@ include file="header.jsp" %>

        <%
            String bmiStr = request.getParameter("bmi");
            String category = request.getParameter("category");

            double bmi = Double.parseDouble(bmiStr);
            String formattedBMI = String.format("%.2f", bmi);
        %>

        <div class="card">
            <h2 class="form-title">BMI Result</h2>

            <div class="result-grid">

                <div class="result-box">
                    <h3>Your BMI</h3>
                    <div class="result-group-flex">
                        <label>BMI Value:</label>
                        <p><%= formattedBMI %></p>
                    </div>
                </div>

                <div class="result-box">
                    <h3>Category</h3>
                    <div class="result-group-flex">
                        <label>Status:</label>
                        <p><%= category %></p>
                    </div>
                </div>

            </div>

            <a href="bmiCalculator.jsp" class="btn btn-back">Calculate Again</a>

        </div>

        <%@ include file="footer.jsp" %>
    </body>
</html>
