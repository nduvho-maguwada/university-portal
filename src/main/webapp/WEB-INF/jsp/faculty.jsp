<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.university.model.Course" %>
<html>
<head>
    <title>Faculty Portal</title>
</head>
<body>
<h2>Update Course Details</h2>

<% String message = (String) request.getAttribute("message");
    String error = (String) request.getAttribute("error");
    if (message != null) { %>
<p style="color:green;"><%= message %></p>
<% }
    if (error != null) { %>
<p style="color:red;"><%= error %></p>
<% } %>

<table border="1" cellpadding="5">
    <tr>
        <th>Course Code</th>
        <th>Course Name</th>
        <th>Instructor</th>
        <th>Schedule</th>
        <th>Action</th>
    </tr>
    <%
        List<Course> courses = (List<Course>) request.getAttribute("courses");
        if (courses != null) {
            for (Course c : courses) {
    %>
    <form method="post" action="faculty">
        <tr>
            <td><%= c.getCode() %></td>
            <td><%= c.getName() %></td>
            <td><input type="text" name="instructor" value="<%= c.getInstructor() %>" required></td>
            <td><input type="text" name="schedule" value="<%= c.getSchedule() %>" required></td>
            <td>
                <input type="hidden" name="courseId" value="<%= c.getId() %>">
                <button type="submit">Update</button>
            </td>
        </tr>
    </form>
    <%
            }
        }
    %>
</table>

<a href="courses">Back to Courses</a>
</body>
</html>
