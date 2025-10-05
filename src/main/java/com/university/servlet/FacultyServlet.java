package com.university.servlet;

import com.university.dao.CourseDAO;
import com.university.model.Course;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/faculty")
public class FacultyServlet extends HttpServlet {

    private CourseDAO courseDAO;

    @Override
    public void init() {
        courseDAO = new CourseDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            List<Course> courses = courseDAO.getAllCourses();
            request.setAttribute("courses", courses);
            request.getRequestDispatcher("/WEB-INF/jsp/faculty.jsp").forward(request, response);
        } catch (SQLException e) {
            throw new ServletException("Cannot retrieve courses", e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String idStr = request.getParameter("courseId");
        String instructor = request.getParameter("instructor");
        String schedule = request.getParameter("schedule");

        if (idStr == null || idStr.isEmpty() || instructor == null || schedule == null) {
            request.setAttribute("error", "All fields are required");
            doGet(request, response);
            return;
        }

        try {
            int courseId = Integer.parseInt(idStr);
            Course course = courseDAO.getCourseById(courseId);
            if (course != null) {
                course.setInstructor(instructor);
                course.setSchedule(schedule);
                courseDAO.updateCourse(course);
                request.setAttribute("message", "Course updated successfully");
            } else {
                request.setAttribute("error", "Course not found");
            }
            doGet(request, response);
        } catch (NumberFormatException e) {
            request.setAttribute("error", "Invalid course ID");
            doGet(request, response);
        } catch (SQLException e) {
            throw new ServletException("Error updating course", e);
        }
    }
}
