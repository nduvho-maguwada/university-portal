package com.university.servlet;

import com.university.dao.StudentDAO;
import com.university.model.Course;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/student")
public class StudentServlet extends HttpServlet {

    private StudentDAO studentDAO;

    @Override
    public void init() {
        studentDAO = new StudentDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Show student form
        request.getRequestDispatcher("/WEB-INF/jsp/student.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String studentIdStr = request.getParameter("studentId");
        if (studentIdStr == null || studentIdStr.isEmpty()) {
            request.setAttribute("error", "Student ID is required");
            request.getRequestDispatcher("/WEB-INF/jsp/student.jsp").forward(request, response);
            return;
        }

        try {
            int studentId = Integer.parseInt(studentIdStr);
            List<Course> courses = studentDAO.getCoursesByStudentId(studentId);
            request.setAttribute("courses", courses);
            request.getRequestDispatcher("/WEB-INF/jsp/studentSchedule.jsp").forward(request, response);
        } catch (NumberFormatException e) {
            request.setAttribute("error", "Invalid Student ID");
            request.getRequestDispatcher("/WEB-INF/jsp/student.jsp").forward(request, response);
        } catch (SQLException e) {
            throw new ServletException("Cannot retrieve student courses", e);
        }
    }
}
