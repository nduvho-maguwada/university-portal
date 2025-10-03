<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.university.model.Course" %>
<html>
<head>
    <title>All Courses</title>
</head>
<body>
<h2>All Courses</h2>
<table border="1" cellpadding="5">
    <tr>
        <th>Course Code</th>
        <th>Course Name</th>
        <th>Instructor</th>
        <th>Schedule</th>
    </tr>
    <%
        List<Course> courses = (List<Course>) request.getAttribute("courses");
        if (courses != null) {
            for (Course c : courses) {
    %>
    <tr>
        <td><%= c.getCode() %></td>
        <td><%= c.getName() %></td>
        <td><%= c.getInstructor() %></td>
        <td><%= c.getSchedule() %></td>
    </tr>
    <%
            }
        }
    %>
</table>
<a href="student">View Student Schedule</a> | <a href="faculty">Faculty Portal</a>
</body>
</html>
