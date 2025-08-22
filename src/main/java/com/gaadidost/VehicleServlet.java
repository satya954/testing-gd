package com.gaadidost;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.*;
import java.sql.*;
import java.util.*;

public class VehicleServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        HttpSession session = req.getSession(false);
        if (session == null || session.getAttribute("userId") == null) {
            resp.sendRedirect("login.jsp");
            return;
        }

        int userId = (int) session.getAttribute("userId");
        List<Map<String,String>> vehicles = new ArrayList<>();

        try (Connection con = DBUtil.getConnection()) {
            PreparedStatement ps = con.prepareStatement("SELECT vehicle_name, vehicle_type, reg_no FROM vehicles WHERE user_id=?");
            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Map<String,String> v = new HashMap<>();
                v.put("name", rs.getString("vehicle_name"));
                v.put("type", rs.getString("vehicle_type"));
                v.put("regno", rs.getString("reg_no"));
                vehicles.add(v);
            }
        } catch (SQLException e) {
            throw new ServletException(e);
        }

        req.setAttribute("vehicles", vehicles);
        RequestDispatcher rd = req.getRequestDispatcher("my-vehicles.jsp");
        rd.forward(req, resp);
    }
}

