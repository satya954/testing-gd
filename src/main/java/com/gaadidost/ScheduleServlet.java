package com.gaadidost;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.*;
import java.sql.*;
import java.util.*;

public class ScheduleServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        HttpSession session = req.getSession(false);
        if (session == null || session.getAttribute("userId") == null) {
            resp.sendRedirect("login.jsp");
            return;
        }

        int userId = (int) session.getAttribute("userId");
        List<Map<String,String>> schedules = new ArrayList<>();

        try (Connection con = DBUtil.getConnection()) {
            PreparedStatement ps = con.prepareStatement(
                "SELECT service_type, service_option, scheduled_for " +
                "FROM bookings WHERE user_id=? AND scheduled_for >= NOW() ORDER BY scheduled_for"
            );
            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Map<String,String> s = new HashMap<>();
                s.put("type", rs.getString("service_type"));
                s.put("option", rs.getString("service_option"));
                s.put("scheduled", rs.getString("scheduled_for"));
                schedules.add(s);
            }
        } catch (SQLException e) {
            throw new ServletException(e);
        }

        req.setAttribute("schedules", schedules);
        RequestDispatcher rd = req.getRequestDispatcher("my-schedules.jsp");
        rd.forward(req, resp);
    }
}

