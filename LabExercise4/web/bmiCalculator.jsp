<%-- 
    Document   : bmiCalculator
    Created on : 21 Apr 2026, 4:38:40 pm
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
        <h1>Hello World!</h1>
        <%@ include file="header.jsp" %>

        <div class="card">
            <h2 class="form-title">BMI Calculator</h2>

            <form action="processBMI.jsp" method="post">

                <div class="form-group">
                    <label class="label">Weight (kg)</label>
                    <input type="number" name="weight" step="0.1" required>
                </div>

                <div class="form-group">
                    <label class="label">Height (m)</label>
                    <input type="number" name="height" step="0.01" required>
                </div>

                <div class="button-group">
                    <input type="submit" value="Calculate" class="btn btn-submit">
                    <input type="reset" value="Reset" class="btn btn-cancel">
                </div>

            </form>
        </div>

        <%@ include file="footer.jsp" %>  
    </body>
</html>
