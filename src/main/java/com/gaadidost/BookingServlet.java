package com.gaadidost;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.*;

public class BookingServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        HttpSession session = req.getSession(false);
        if (session == null || session.getAttribute("userId") == null) {
            resp.sendRedirect("login.jsp");
            return;
        }

        int userId = (int) session.getAttribute("userId");
        String serviceType = req.getParameter("serviceType");
        String serviceOption = req.getParameter("serviceOption");
        String scheduledFor = req.getParameter("scheduledFor"); // yyyy-MM-ddTHH:mm

        try (Connection con = DBUtil.getConnection()) {
            String sql = "INSERT INTO bookings (user_id, service_type, service_option, scheduled_for, notes) " +
                         "VALUES (?, ?, ?, ?, ?)";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, userId);
            ps.setString(2, serviceType);
            ps.setString(3, serviceOption);
            ps.setString(4, scheduledFor != null && !scheduledFor.isEmpty() ? scheduledFor.replace("T"," ") : null);
            ps.setString(5, req.getParameter("notes"));
            ps.executeUpdate();
        } catch (SQLException e) {
            throw new ServletException(e);
        }

        resp.sendRedirect("my-bookings.jsp");
    }
}

