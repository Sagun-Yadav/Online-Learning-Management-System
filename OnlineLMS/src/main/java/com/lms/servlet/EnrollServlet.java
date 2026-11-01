
package com.lms.servlet;

import com.lms.util.DBConnection;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet("/enroll")
public class EnrollServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        // Check student login
        if (session == null ||
            session.getAttribute("studentId") == null) {

            response.sendRedirect(
                request.getContextPath() + "/login");
            return;
        }

        try {
            int courseId = Integer.parseInt(
                request.getParameter("courseId"));

            int studentId = (Integer)
                session.getAttribute("studentId");

            String sql =
                "INSERT INTO enrollments(student_id, course_id) VALUES (?, ?)";

            try (Connection con = DBConnection.getConnection();
                 PreparedStatement ps = con.prepareStatement(sql)) {

                ps.setInt(1, studentId);
                ps.setInt(2, courseId);

                ps.executeUpdate();

                response.sendRedirect(
                    request.getContextPath() +
                    "/my-courses?enrolled=1");
            }

        } catch (NumberFormatException e) {

            response.sendError(400, "Invalid course ID.");

        } catch (SQLException e) {

            if (e.getSQLState() != null &&
                e.getSQLState().startsWith("23")) {

                response.sendRedirect(
                    request.getContextPath() +
                    "/courses?duplicate=1");

            } else {
                throw new ServletException(
                    "Course enrollment failed.", e);
            }
        }
    }
}
