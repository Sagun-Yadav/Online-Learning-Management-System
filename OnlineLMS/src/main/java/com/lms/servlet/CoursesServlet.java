
package com.lms.servlet;

import com.lms.model.Course;
import com.lms.util.DBConnection;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/courses")
public class CoursesServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        // Check student login
        HttpSession session = request.getSession(false);

        if (session == null ||
            session.getAttribute("studentId") == null) {

            response.sendRedirect(
                request.getContextPath() + "/login");
            return;
        }

        // Create course list
        List<Course> courses = new ArrayList<>();

        String sql = "SELECT * FROM courses ORDER BY course_id";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {

                Course course = new Course(
                    rs.getInt("course_id"),
                    rs.getString("course_name"),
                    rs.getString("description"),
                    rs.getString("instructor")
                );

                courses.add(course);
            }

        } catch (Exception e) {

            throw new ServletException(
                "Unable to retrieve courses from database.", e);
        }

        // Send courses to JSP
        request.setAttribute("courses", courses);

        request.getRequestDispatcher(
            "/WEB-INF/views/courses.jsp")
            .forward(request, response);
    }
}
