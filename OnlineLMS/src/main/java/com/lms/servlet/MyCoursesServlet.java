
package com.lms.servlet;

import com.lms.model.Course;
import com.lms.util.DBConnection;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/my-courses")
public class MyCoursesServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null ||
            session.getAttribute("studentId") == null) {

            response.sendRedirect(
                request.getContextPath() + "/login");
            return;
        }

        int studentId = (Integer)
            session.getAttribute("studentId");

        List<Course> courses = new ArrayList<>();

        String sql =
            "SELECT c.course_id, c.course_name, c.description, c.instructor " +
            "FROM courses c " +
            "JOIN enrollments e ON c.course_id = e.course_id " +
            "WHERE e.student_id = ?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, studentId);

            try (ResultSet rs = ps.executeQuery()) {

                while (rs.next()) {

                    Course course = new Course(
                        rs.getInt("course_id"),
                        rs.getString("course_name"),
                        rs.getString("description"),
                        rs.getString("instructor")
                    );

                    courses.add(course);
                }
            }

        } catch (SQLException e) {

            throw new ServletException(
                "Unable to retrieve enrolled courses.", e);
        }

        request.setAttribute("courses", courses);

        if ("1".equals(request.getParameter("enrolled"))) {
            request.setAttribute(
                "success", "You have successfully enrolled!");
        }

        request.getRequestDispatcher(
            "/WEB-INF/views/mycourses.jsp")
            .forward(request, response);
    }
}
