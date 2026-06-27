<%-- 
    Document   : login
    Created on : 12 May 2026, 4:41:03 pm
    Author     : flora
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>User Login</title>
</head>
<body>
    <h2>System Login</h2>
    
    <%-- Display error message if redirected from doLogin.jsp --%>
    <% 
        String message = request.getParameter("msg");
        if (message != null) {
            out.println("<p style='color:red; font-weight:bold;'>" + message + "</p>");
        }
    %>

    <form action="doLogin.jsp" method="POST">
        <table border="0">
            <tr>
                <td>Username:</td>
                <td><input type="text" name="username" required></td>
            </tr>
            <tr>
                <td>Password:</td>
                <td><input type="password" name="password" required></td>
            </tr>
            <tr>
                <td colspan="2"><input type="submit" value="Login"></td>
            </tr>
        </table>
    </form>
    <br>
    <a href="insertUser.html">Register a new account</a>
</body>
</html>
