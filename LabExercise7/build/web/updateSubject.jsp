<%-- 
    Document   : updateSubject
    Created on : 26 Jun 2026, 4:14:55 am
    Author     : flora
--%>

<%@page import="com.lab.bean.SubjectBean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<body>
    <h2>Update Subject Details</h2>
    <% SubjectBean subject = (SubjectBean) request.getAttribute("subject"); %>
    
    <form action="SubjectServlet" method="POST">
        <input type="hidden" name="action" value="update">
        <input type="hidden" name="id" value="<%= subject.getId() %>">
        
        Subject Code: <input type="text" name="subjectCode" value="<%= subject.getSubjectCode() %>" required><br><br>
        Subject Name: <input type="text" name="subjectName" value="<%= subject.getSubjectName() %>" required><br><br>
        
        <input type="submit" value="Update Subject">
    </form>
    <br><a href="SubjectServlet?action=view">Cancel</a>
</body>
</html>
