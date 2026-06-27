<%-- 
    Document   : registerSubject
    Created on : 26 Jun 2026, 4:14:00 am
    Author     : flora
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<body>
    <h2>Register a New Subject</h2>
    <form action="../SubjectServlet" method="POST">
        <input type="hidden" name="action" value="add">
        Subject Code: <input type="text" name="subjectCode" required><br><br>
        Subject Name: <input type="text" name="subjectName" required><br><br>
        <input type="submit" value="Register Subject">
    </form>
    <br><a href="../SubjectServlet?action=view">Back to My Subjects</a>
</body>
</html>