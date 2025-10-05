<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>University Portal</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" rel="stylesheet">
</head>
<body>

<div class="container d-flex flex-column align-items-center justify-content-center" style="min-height: 100vh;">

    <h1 class="mb-4 text-center"><i class="fas fa-university me-2"></i>University Portal</h1>

    <div class="d-grid gap-3 mb-3" style="max-width: 350px;">
        <a href="courses" class="btn btn-primary btn-lg"><i class="fas fa-book-open me-2"></i>View All Courses</a>
    </div>

    <form action="student" method="post" class="d-flex gap-2 mb-3" style="max-width: 350px;">
        <input type="text" name="studentId" class="form-control" placeholder="Student ID" required>
        <button type="submit" class="btn btn-success"><i class="fas fa-calendar-alt me-1"></i>View Schedule</button>
    </form>

    <div class="d-grid gap-3" style="max-width: 350px;">
        <a href="faculty" class="btn btn-secondary btn-lg"><i class="fas fa-chalkboard-teacher me-2"></i>Faculty Dashboard</a>
    </div>

</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/js/all.min.js"></script>
</body>
</html>
