<%@ page import="java.util.List" %>
<%@ page import="com.university.model.Course" %>
<%
    List<Course> courses = (List<Course>) request.getAttribute("courses");
    Course edit = (Course) request.getAttribute("courseToEdit");
%>
<!doctype html>
<html><head><meta charset="utf-8"><title>Faculty - Update Course</title></head>
<body>
<h2>Faculty — Update Course</h2>
<p style="color:red">${requestScope.error}</p>
<p>Select a course to edit:</p>
<form method="get" action="${pageContext.request.contextPath}/faculty">
    <select name="courseId">
        <option value="">-- choose --</option>
        <c:forEach items="${courses}" var="c">
            <option value="${c.courseId}" ${param.courseId == c.courseId ? "selected" : ""}>${c.courseCode} - ${c.courseName}</option>
        </c:forEach>
    </select>
    <button type="submit">Load</button>
</form>

<c:if test="${not empty courseToEdit}">
    <h3>Editing: ${courseToEdit.courseCode} — ${courseToEdit.courseName}</h3>
    <form method="post" action="${pageContext.request.contextPath}/faculty">
        <input type="hidden" name="course_id" value="${courseToEdit.courseId}" />
        <div>
            <label>Course Code: <input type="text" name="course_code" value="${courseToEdit.courseCode}" required /></label>
        </div>
        <div>
            <label>Course Name: <input type="text" name="course_name" value="${courseToEdit.courseName}" required /></label>
        </div>
        <div>
            <label>Instructor: <input type="text" name="instructor" value="${courseToEdit.instructor}" /></label>
        </div>
        <div>
            <label>Schedule: <input type="text" name="schedule" value="${courseToEdit.schedule}" /></label>
        </div>
        <div>
            <button type="submit">Save Changes</button>
        </div>
    </form>
</c:if>

<p><a href="${pageContext.request.contextPath}">Home</a></p>
</body></html>
