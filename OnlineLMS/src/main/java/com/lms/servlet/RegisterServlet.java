
package com.lms.servlet;

import com.lms.util.DBConnection;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import org.mindrot.jbcrypt.BCrypt;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        request.getRequestDispatcher(
            "/WEB-INF/views/register.jsp"
        ).forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        if (name == null || name.isBlank()
                || email == null || email.isBlank()
                || password == null || password.length() < 6) {

            request.setAttribute("error",
                "Please enter valid details. Password must contain at least 6 characters.");

            doGet(request, response);
            return;
        }

        String hashedPassword =
            BCrypt.hashpw(password, BCrypt.gensalt());

        String sql =
            "INSERT INTO students(name, email, password) VALUES (?, ?, ?)";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, name.trim());
            ps.setString(2, email.trim().toLowerCase());
            ps.setString(3, hashedPassword);

            ps.executeUpdate();

            response.sendRedirect(
                request.getContextPath() + "/register?success=1"
            );

        } catch (SQLException e) {

            if (e.getSQLState() != null
                    && e.getSQLState().startsWith("23")) {

                request.setAttribute("error",
                    "This email is already registered.");

                doGet(request, response);

            } else {
                throw new ServletException(
                    "Student registration failed.", e);
            }
        }
    }
}
