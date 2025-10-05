package com.university.dao;

import com.university.model.Course;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class StudentDAO {
    private final String jdbcURL = "jdbc:postgresql://localhost:5432/university_portal";
    private final String jdbcUsername = "uni_user";
    private final String jdbcPassword = "StrongPassword123";

    public StudentDAO() {
        try {
            Class.forName("org.postgresql.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException("PostgreSQL JDBC Driver not found", e);
        }
    }

    private Connection getConnection() throws SQLException {
        return DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
    }

    public List<Course> getCoursesByStudentId(int studentId) throws SQLException {
        List<Course> courses = new ArrayList<>();
        String sql = "SELECT c.course_id, c.course_code, c.course_name, c.instructor, c.schedule " +
                "FROM courses c " +
                "JOIN student_course sc ON c.course_id = sc.course_id " +
                "WHERE sc.student_id = ?";

        try (Connection conn = getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, studentId);
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    Course course = new Course();
                    course.setId(rs.getInt("course_id"));
                    course.setCode(rs.getString("course_code"));
                    course.setName(rs.getString("course_name"));
                    course.setInstructor(rs.getString("instructor"));
                    course.setSchedule(rs.getString("schedule"));
                    courses.add(course);
                }
            }
        }
        return courses;
    }
}
