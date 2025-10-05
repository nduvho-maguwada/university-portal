<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.university.model.Course" %>
<!DOCTYPE html>
<html>
<head>
    <title>Update Courses</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" rel="stylesheet">
</head>
<body class="bg-light">

<div class="container py-5">

    <div class="text-center mb-4">
        <h2 class="fw-bold text-secondary"><i class="fas fa-chalkboard-teacher me-2"></i>Faculty: Update Courses</h2>
    </div>

    <% String error = (String) request.getAttribute("error"); %>
    <% if (error != null) { %>
    <div class="alert alert-danger text-center"><%= error %></div>
    <% } %>

    <%
        List<Course> courses = (List<Course>) request.getAttribute("courses");
        if (courses != null && !courses.isEmpty()) {
    %>

    <div class="table-responsive">
        <table class="table table-striped table-hover align-middle bg-white shadow-sm">
            <thead class="table-secondary">
            <tr>
                <th>Course Code</th>
                <th>Course Name</th>
                <th>Instructor</th>
                <th>Schedule</th>
                <th>Action</th>
            </tr>
            </thead>
            <tbody>
            <% for (Course c : courses) { %>
            <tr>
                <form method="post" action="faculty">
                    <td><%= c.getCourseCode() %></td>
                    <td><%= c.getCourseName() %></td>
                    <td>
                        <input type="text" name="instructor" class="form-control" value="<%= c.getInstructor() %>">
                    </td>
                    <td>
                        <input type="text" name="schedule" class="form-control" value="<%= c.getSchedule() %>">
                    </td>
                    <td>
                        <input type="hidden" name="courseId" value="<%= c.getId() %>">
                        <button type="submit" class="btn btn-primary btn-sm"><i class="fas fa-edit me-1"></i>Update</button>
                    </td>
                </form>
            </tr>
            <% } %>
            </tbody>
        </table>
    </div>

    <% } else { %>
    <p class="text-center text-muted py-4">No courses found.</p>
    <% } %>

</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/js/all.min.js"></script>
</body>
</html>
