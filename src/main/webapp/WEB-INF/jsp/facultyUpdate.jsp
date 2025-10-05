<%@ page import="java.util.List" %>
<%@ page import="com.university.model.Course" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    List<Course> courses = (List<Course>) request.getAttribute("courses");
    Course edit = (Course) request.getAttribute("courseToEdit");
%>
<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <title>Faculty - Update Course</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" rel="stylesheet">
</head>
<body class="bg-light">
<div class="container py-5">

    <div class="text-center mb-4">
        <h2 class="fw-bold text-secondary"><i class="fas fa-edit me-2"></i>Faculty — Update Course</h2>
    </div>

    <c:if test="${not empty requestScope.error}">
        <div class="alert alert-danger text-center">${requestScope.error}</div>
    </c:if>

    <div class="mb-4">
        <p>Select a course to edit:</p>
        <form method="get" action="${pageContext.request.contextPath}/faculty" class="d-flex gap-2 flex-wrap align-items-center">
            <select name="courseId" class="form-select" style="max-width: 300px;">
                <option value="">-- choose --</option>
                <c:forEach items="${courses}" var="c">
                    <option value="${c.courseId}" ${param.courseId == c.courseId ? "selected" : ""}>
                            ${c.courseCode} - ${c.courseName}
                    </option>
                </c:forEach>
            </select>
            <button type="submit" class="btn btn-primary"><i class="fas fa-download me-1"></i>Load</button>
        </form>
    </div>

    <c:if test="${not empty courseToEdit}">
        <div class="bg-white p-4 shadow-sm rounded">
            <h4 class="fw-bold mb-3 text-success">Editing: ${courseToEdit.courseCode} — ${courseToEdit.courseName}</h4>
            <form method="post" action="${pageContext.request.contextPath}/faculty" class="row g-3">
                <input type="hidden" name="course_id" value="${courseToEdit.courseId}" />

                <div class="col-md-6">
                    <label class="form-label">Course Code</label>
                    <input type="text" name="course_code" class="form-control" value="${courseToEdit.courseCode}" required />
                </div>
                <div class="col-md-6">
                    <label class="form-label">Course Name</label>
                    <input type="text" name="course_name" class="form-control" value="${courseToEdit.courseName}" required />
                </div>
                <div class="col-md-6">
                    <label class="form-label">Instructor</label>
                    <input type="text" name="instructor" class="form-control" value="${courseToEdit.instructor}" />
                </div>
                <div class="col-md-6">
                    <label class="form-label">Schedule</label>
                    <input type="text" name="schedule" class="form-control" value="${courseToEdit.schedule}" />
                </div>
                <div class="col-12 text-center mt-3">
                    <button type="submit" class="btn btn-success"><i class="fas fa-save me-1"></i>Save Changes</button>
                </div>
            </form>
        </div>
    </c:if>

    <div class="text-center mt-4">
        <a href="${pageContext.request.contextPath}" class="btn btn-secondary"><i class="fas fa-home me-1"></i>Home</a>
    </div>

</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/js/all.min.js"></script>
</body>
</html>
