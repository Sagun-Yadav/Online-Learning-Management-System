package com.lms.servlet;

import com.lms.util.DBConnection;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import org.mindrot.jbcrypt.BCrypt;

@WebServlet("/change-password")
public class ChangePasswordServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("studentId") == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        int studentId = (Integer) session.getAttribute("studentId");

        String currentPassword = request.getParameter("currentPassword");
        String newPassword = request.getParameter("newPassword");
        String confirmPassword = request.getParameter("confirmPassword");

        if (currentPassword == null || newPassword == null
                || confirmPassword == null
                || currentPassword.isBlank()
                || newPassword.isBlank()
                || confirmPassword.isBlank()) {

            response.sendRedirect(request.getContextPath() + "/profile?passwordEmpty=1");
            return;
        }

        if (newPassword.length() < 8) {
            response.sendRedirect(request.getContextPath() + "/profile?passwordShort=1");
            return;
        }

        if (!newPassword.equals(confirmPassword)) {
            response.sendRedirect(request.getContextPath() + "/profile?passwordMismatch=1");
            return;
        }

        try (Connection con = DBConnection.getConnection()) {

            String selectSQL = "SELECT password FROM students WHERE student_id = ?";

            try (PreparedStatement ps = con.prepareStatement(selectSQL)) {

                ps.setInt(1, studentId);

                try (ResultSet rs = ps.executeQuery()) {

                    if (!rs.next()) {
                        response.sendRedirect(request.getContextPath() + "/login");
                        return;
                    }

                    String storedHash = rs.getString("password");

                    if (!BCrypt.checkpw(currentPassword, storedHash)) {
                        response.sendRedirect(request.getContextPath() + "/profile?wrongPassword=1");
                        return;
                    }
                }
            }

            String newHash = BCrypt.hashpw(newPassword, BCrypt.gensalt());

            String updateSQL = "UPDATE students SET password = ? WHERE student_id = ?";

            try (PreparedStatement ps = con.prepareStatement(updateSQL)) {

                ps.setString(1, newHash);
                ps.setInt(2, studentId);

                ps.executeUpdate();
            }

            response.sendRedirect(request.getContextPath() + "/profile?passwordChanged=1");

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/profile?passwordError=1");
        }
    }
}