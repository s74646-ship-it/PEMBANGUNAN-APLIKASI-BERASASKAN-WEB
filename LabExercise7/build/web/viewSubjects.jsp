<%-- 
    Document   : viewSubjects
    Created on : 26 Jun 2026, 4:14:25 am
    Author     : flora
--%>

<%@page import="java.util.List"%>
<%@page import="com.lab.bean.SubjectBean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<body>
    <h2>My Registered Subjects</h2>
    <a href="subject/registerSubject.jsp">Register New Subject</a><br><br>
    
    <table border="1" cellpadding="8">
        <tr style="background-color: lightgray;">
            <th>Subject Code</th>
            <th>Subject Name</th>
            <th>Actions</th>
        </tr>
        <%
            List<SubjectBean> subjectList = (List<SubjectBean>) request.getAttribute("subjectList");
            if(subjectList != null) {
                for(SubjectBean subject : subjectList) {
        %>
        <tr>
            <td><%= subject.getSubjectCode() %></td>
            <td><%= subject.getSubjectName() %></td>
            <td>
                <a href="SubjectServlet?action=edit&id=<%= subject.getId() %>">Edit</a> | 
                <a href="SubjectServlet?action=delete&id=<%= subject.getId() %>" onclick="return confirm('Delete this subject?');">Delete</a>
            </td>
        </tr>
        <%
                }
            } else {
                out.println("<tr><td colspan='3'>No subjects registered.</td></tr>");
            }
        %>
    </table>
    <br><a href="dashboard.jsp">Back to Main Dashboard</a>
</body>
</html>