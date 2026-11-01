
package com.lms.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.lms.util.DBConnection;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/update-profile")
public class UpdateProfileServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
                          throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("studentId") == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        String name = request.getParameter("name");
        String email = request.getParameter("email");

        if (name == null || email == null ||
            name.trim().isEmpty() || email.trim().isEmpty()) {

            response.sendRedirect(
                request.getContextPath() + "/profile?error=1");
            return;
        }

        name = name.trim();
        email = email.trim().toLowerCase();

        int studentId = (Integer) session.getAttribute("studentId");

        String sql = "UPDATE students SET name = ?, email = ? WHERE student_id = ?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, name);
            ps.setString(2, email);
            ps.setInt(3, studentId);

            ps.executeUpdate();

            session.setAttribute("studentName", name);
            session.setAttribute("studentEmail", email);

            response.sendRedirect(
                request.getContextPath() + "/profile?updated=1");

        } catch (SQLException e) {

            if (e.getSQLState() != null &&
                e.getSQLState().startsWith("23")) {

                response.sendRedirect(
                    request.getContextPath() + "/profile?emailExists=1");

            } else {
                throw new ServletException("Unable to update profile.", e);
            }
        }
    }
}
