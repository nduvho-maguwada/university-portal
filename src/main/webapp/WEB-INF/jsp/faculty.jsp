<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.university.model.Course" %>
<html>
<head>
    <title>Faculty Portal</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" rel="stylesheet">
</head>
<body class="bg-light">
<div class="container py-5">

    <div class="text-center mb-4">
        <h2 class="fw-bold text-secondary"><i class="fas fa-chalkboard-teacher me-2"></i>Update Course Details</h2>
    </div>

    <% String message = (String) request.getAttribute("message");
        String error = (String) request.getAttribute("error");
        if (message != null) { %>
    <div class="alert alert-success text-center"><%= message %></div>
    <% }
        if (error != null) { %>
    <div class="alert alert-danger text-center"><%= error %></div>
    <% } %>

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
            <%
                List<Course> courses = (List<Course>) request.getAttribute("courses");
                if (courses != null && !courses.isEmpty()) {
                    for (Course c : courses) {
            %>
            <form method="post" action="faculty">
                <tr>
                    <td><%= c.getCode() %></td>
                    <td><%= c.getName() %></td>
                    <td><input type="text" name="instructor" class="form-control" value="<%= c.getInstructor() %>" required></td>
                    <td><input type="text" name="schedule" class="form-control" value="<%= c.getSchedule() %>" required></td>
                    <td>
                        <input type="hidden" name="courseId" value="<%= c.getId() %>">
                        <button type="submit" class="btn btn-primary btn-sm"><i class="fas fa-edit me-1"></i>Update</button>
                    </td>
                </tr>
            </form>
            <%
                }
            } else {
            %>
            <tr>
                <td colspan="5" class="text-center text-muted py-4">No courses available</td>
            </tr>
            <%
                }
            %>
            </tbody>
        </table>
    </div>

    <div class="text-center mt-4">
        <a href="courses" class="btn btn-secondary"><i class="fas fa-arrow-left me-1"></i>Back to Courses</a>
    </div>

</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/js/all.min.js"></script>
</body>
</html>
