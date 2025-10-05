package com.university.dao;

import com.university.model.Course;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CourseDAO {
    private final String jdbcURL = "jdbc:postgresql://localhost:5432/university_portal";
    private final String jdbcUsername = "uni_user";
    private final String jdbcPassword = "StrongPassword123";

    public CourseDAO() {
        try {
            Class.forName("org.postgresql.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException("PostgreSQL Driver not found", e);
        }
    }

    private Connection getConnection() throws SQLException {
        return DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
    }

    public List<Course> getAllCourses() throws SQLException {
        List<Course> courses = new ArrayList<>();
        String sql = "SELECT * FROM courses";
        try (Connection conn = getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

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
        return courses;
    }

    public void updateCourse(Course course) throws SQLException {
        String sql = "UPDATE courses SET instructor = ?, schedule = ? WHERE course_id = ?";
        try (Connection conn = getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
             stmt.setString(1, course.getInstructor());
             stmt.setString(2, course.getSchedule());
             stmt.setInt(3, course.getId());
             stmt.executeUpdate();
        }
    }

    public Course getCourseById(int courseId) throws SQLException {
        String sql = "SELECT * FROM courses WHERE course_id = ?";
        Course course = null;
        try (Connection conn = getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, courseId);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    course = new Course();
                    course.setId(rs.getInt("course_id"));
                    course.setCode(rs.getString("course_code"));
                    course.setName(rs.getString("course_name"));
                    course.setInstructor(rs.getString("instructor"));
                    course.setSchedule(rs.getString("schedule"));
                }
            }
        }
        return course;
    }
}
