<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%-- Import JSTL Core Taglib [cite: 467] --%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Employee Payroll Display System</title>
</head>
<body>
    <h2>Employee Payroll List</h2>
    <table border="1" cellpadding="10">
        <thead>
            <tr style="background-color: #f2f2f2;">
                <th>ID</th>
                <th>Name</th>
                <th>Department</th>
                <th>Basic Salary (RM)</th>
                <th>Status</th>
            </tr>
        </thead>
        <tbody>
            <%-- Iterate through the employeeList [cite: 468] --%>
            <c:forEach var="emp" items="${employeeList}">
                <tr>
                    <td><c:out value="${emp.empId}" /></td>
                    <td><c:out value="${emp.name}" /></td>
                    <td><c:out value="${emp.department}" /></td>
                    <td><c:out value="${emp.basicSalary}" /></td>
                    <td>
                        <%-- Logic Challenge: Senior vs Junior [cite: 469, 470] --%>
                        <c:choose>
                            <c:when test="${emp.basicSalary >= 3000}">
                                <strong>Senior</strong>
                            </c:when>
                            <c:otherwise>
                                Junior
                            </c:otherwise>
                        </c:choose>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</body>
</html>