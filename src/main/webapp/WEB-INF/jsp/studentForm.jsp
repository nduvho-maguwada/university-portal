<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <title>Student Schedule - Enter ID</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" rel="stylesheet">
</head>
<body class="bg-light">
<div class="container py-5">

    <div class="text-center mb-4">
        <h2 class="fw-bold text-success"><i class="fas fa-calendar-alt me-2"></i>Student Schedule</h2>
        <p class="text-muted mb-3">Enter your student ID to view your schedule</p>
    </div>

    <c:if test="${not empty requestScope.error}">
        <div class="alert alert-danger text-center">${requestScope.error}</div>
    </c:if>

    <form method="get" action="${pageContext.request.contextPath}/student" class="mx-auto" style="max-width: 400px;">
        <div class="mb-3">
            <input type="text" name="studentId" class="form-control" placeholder="Student ID" required />
        </div>
        <div class="text-center">
            <button type="submit" class="btn btn-success"><i class="fas fa-search me-1"></i>View Schedule</button>
        </div>
    </form>

    <div class="text-center mt-4">
        <a href="${pageContext.request.contextPath}" class="btn btn-secondary"><i class="fas fa-home me-1"></i>Home</a>
    </div>

</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/js/all.min.js"></script>
</body>
</html>
