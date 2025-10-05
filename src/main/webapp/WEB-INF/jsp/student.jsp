<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.university.model.Course" %>
<html>
<head>
    <title>Student Schedule</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" rel="stylesheet">
</head>
<body class="bg-light">
<div class="container py-5">

    <div class="text-center mb-4">
        <h2 class="fw-bold text-success"><i class="fas fa-calendar-alt me-2"></i>Your Course Schedule</h2>
    </div>

    <div class="table-responsive">
        <table class="table table-striped table-hover align-middle bg-white shadow-sm">
            <thead class="table-success">
            <tr>
                <th>Course Code</th>
                <th>Course Name</th>
                <th>Instructor</th>
                <th>Schedule</th>
            </tr>
            </thead>
            <tbody>
            <%
                List<Course> courses = (List<Course>) request.getAttribute("courses");
                if (courses != null && !courses.isEmpty()) {
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
            } else {
            %>
            <tr>
                <td colspan="4" class="text-center text-muted py-4">No courses found for this student.</td>
            </tr>
            <%
                }
            %>
            </tbody>
        </table>
    </div>

    <div class="text-center mt-4">
        <a href="student" class="btn btn-success me-2"><i class="fas fa-arrow-left me-1"></i>Back</a>
        <a href="courses" class="btn btn-primary"><i class="fas fa-book-open me-1"></i>All Courses</a>
    </div>

</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/js/all.min.js"></script>
</body>
</html>
