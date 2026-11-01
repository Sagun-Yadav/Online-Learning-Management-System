
package com.lms.servlet;

import com.lms.util.DBConnection;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import org.mindrot.jbcrypt.BCrypt;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        request.getRequestDispatcher(
            "/WEB-INF/views/login.jsp"
        ).forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        String sql =
            "SELECT student_id, name, email, password FROM students WHERE email = ?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, email.trim().toLowerCase());

            try (ResultSet rs = ps.executeQuery()) {

                if (rs.next() &&
                    BCrypt.checkpw(password, rs.getString("password"))) {

                    HttpSession session = request.getSession(true);

                    session.setAttribute(
                        "studentId", rs.getInt("student_id"));

                    session.setAttribute(
                        "studentName", rs.getString("name"));

                    session.setAttribute(
                        "studentEmail", rs.getString("email"));

                    response.sendRedirect(
                    	    request.getContextPath() + "/courses");;

                } else {

                    request.setAttribute(
                        "error", "Invalid email or password.");

                    doGet(request, response);
                }
            }

        } catch (Exception e) {
            throw new ServletException("Login failed.", e);
        }
    }
}
