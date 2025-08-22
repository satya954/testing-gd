package com.gaadidost;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.mindrot.jbcrypt.BCrypt;

public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        try (Connection conn = DBUtil.getConnection()) {
            String sql = "SELECT password FROM users WHERE username=?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, username);

            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                String storedHash = rs.getString("password");

                // ✅ Verify hash
                if (BCrypt.checkpw(password, storedHash)) {
		    HttpSession session = request.getSession();
		    session.setAttribute("username", username);
                    response.sendRedirect("welcome.jsp");
                } else {
                    response.sendRedirect("login.jsp?error=1");
                }
            } else {
                response.sendRedirect("login.jsp?error=1");
            }

        } catch (Exception e) {
            e.printStackTrace();
            throw new ServletException("Login failed", e);
        }
    }
}

