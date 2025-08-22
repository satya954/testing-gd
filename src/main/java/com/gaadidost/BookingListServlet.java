package com.gaadidost;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.*;
import java.sql.*;
import java.util.*;

public class BookingListServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        HttpSession session = req.getSession(false);
        if (session == null || session.getAttribute("userId") == null) {
            resp.sendRedirect("login.jsp");
            return;
        }

        int userId = (int) session.getAttribute("userId");
        List<Map<String,String>> bookings = new ArrayList<>();

        try (Connection con = DBUtil.getConnection()) {
            PreparedStatement ps = con.prepareStatement(
                "SELECT service_type, service_option, scheduled_for, booking_date, notes " +
                "FROM bookings WHERE user_id=? ORDER BY booking_date DESC"
            );
            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Map<String,String> b = new HashMap<>();
                b.put("type", rs.getString("service_type"));
                b.put("option", rs.getString("service_option"));
                b.put("scheduled", rs.getString("scheduled_for"));
                b.put("date", rs.getString("booking_date"));
                b.put("notes", rs.getString("notes"));
                bookings.add(b);
            }
        } catch (SQLException e) {
            throw new ServletException(e);
        }

        req.setAttribute("bookings", bookings);
        RequestDispatcher rd = req.getRequestDispatcher("my-bookings.jsp");
        rd.forward(req, resp);
    }
}

