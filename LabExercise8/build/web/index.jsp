<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Car Shop Management</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" 
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" 
          crossorigin="anonymous">
</head>
<body>
    <h1>Application MVC System for Car Shop</h1><br>
    <ul>
        <li><a href="<%= request.getContextPath() %>/CarList.jsp"> View Car Pricelist </a></li>
        <li><a href="<%= request.getContextPath() %>/CarForm.jsp"> Add a New Car Entry </a></li>
    </ul>
</body>
</html>