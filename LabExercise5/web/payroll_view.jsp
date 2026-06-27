<%-- 
    Document   : payroll_view
    Created on : 26 Jun 2026, 12:37:16 am
    Author     : flora
--%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
    <title>Employee Payroll Display System</title>
</head>
<body>
    <h2>Employee Payroll Display System</h2>

    <table border="1" cellpadding="8">
        <thead>
            <tr style="background-color: lightgray;">
                <th>Employee ID</th>
                <th>Name</th>
                <th>Department</th>
                <th>Basic Salary (RM)</th>
                <th>Status</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${employeeList}" var="emp">
                <tr>
                    <td>${emp.empId}</td>
                    <td>${emp.name}</td>
                    <td>${emp.department}</td>
                    <td>${emp.basicSalary}</td>
                    <td>
                        <c:choose>
                            <c:when test="${emp.basicSalary >= 3000}">
                                <span style="color: green; font-weight: bold;">Senior</span>
                            </c:when>
                            <c:otherwise>
                                <span style="color: blue;">Junior</span>
                            </c:otherwise>
                        </c:choose>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</body>
</html>
