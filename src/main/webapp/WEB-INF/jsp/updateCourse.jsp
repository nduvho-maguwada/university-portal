<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.university.model.Course" %>
<!DOCTYPE html>
<html>
<head>
    <title>Update Courses</title>
    <style>
        table { border-collapse: collapse; width: 80%; margin: 20px auto; }
        th, td { border: 1px solid #ccc; padding: 10px; text-align: left; }
        th { background-color: #f4f4f4; }
        .error { color: red; text-align: center; }
        input[type=text] { width: 100%; }
        button { padding: 5px 10px; }
    </style>
</head>
<body>
<h2 style="text-align:center;">Faculty: Update Courses</h2>

<% String error = (String) request.getAttribute("error"); %>
<% if (error != null) { %>
<p class="error"><%= error %></p>
<% } %>

<%
    List<Course> courses = (List<Course>) request.getAttribute("courses");
    if (courses != null && !courses.isEmpty()) {
%>
<table>
    <tr>
        <th>Course Code</th>
        <th>Course Name</th>
        <th>Instructor</th>
        <th>Schedule</th>
        <th>Action</th>
    </tr>
    <% for (Course c : courses) { %>
    <tr>
        <form method="post" action="faculty">
            <td><%= c.getCourseCode() %></td>
            <td><%= c.getCourseName() %></td>
            <td>
                <input type="text" name="instructor" value="<%= c.getInstructor() %>">
            </td>
            <td>
                <input type="text" name="schedule" value="<%= c.getSchedule() %>">
            </td>
            <td>
                <input type="hidden" name="courseId" value="<%= c.getId() %>">
                <button type="submit">Update</button>
            </td>
        </form>
    </tr>
    <% } %>
</table>
<% } else { %>
<p style="text-align:center;">No courses found.</p>
<% } %>

</body>
</html>
