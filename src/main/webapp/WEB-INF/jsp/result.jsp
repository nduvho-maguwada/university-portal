<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <title>Result</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" rel="stylesheet">
</head>
<body class="bg-light">
<div class="container py-5">

    <div class="text-center mb-4">
        <h2 class="fw-bold text-primary"><i class="fas fa-info-circle me-2"></i>Result</h2>
    </div>

    <c:if test="${not empty requestScope.message}">
        <div class="alert alert-success text-center">
            <i class="fas fa-check-circle me-1"></i> ${requestScope.message}
        </div>
    </c:if>

    <c:if test="${not empty requestScope.error}">
        <div class="alert alert-danger text-center">
            <i class="fas fa-exclamation-circle me-1"></i> ${requestScope.error}
        </div>
    </c:if>

    <div class="text-center mt-4">
        <a href="${pageContext.request.contextPath}/faculty" class="btn btn-secondary">
            <i class="fas fa-arrow-left me-1"></i> Back to Faculty Page
        </a>
    </div>

</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/js/all.min.js"></script>
</body>
</html>
