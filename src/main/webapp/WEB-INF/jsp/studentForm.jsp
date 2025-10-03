<!doctype html>
<html><head><meta charset="utf-8"><title>Student Schedule - Enter ID</title></head>
<body>
<h2>Student Schedule</h2>
<form method="get" action="${pageContext.request.contextPath}/student">
    <label>Student ID: <input type="text" name="studentId" /></label>
    <button type="submit">View Schedule</button>
</form>
<p style="color:red">${requestScope.error}</p>
<p><a href="${pageContext.request.contextPath}">Home</a></p>
</body></html>
