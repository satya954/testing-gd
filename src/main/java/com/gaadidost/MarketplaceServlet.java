package com.gaadidost;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.*;
import java.sql.*;
import java.util.*;

public class MarketplaceServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        // BUY page
        List<Map<String,String>> items = new ArrayList<>();
        try (Connection con = DBUtil.getConnection()) {
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery("SELECT vehicle_type, model, age, accidents, estimated_price FROM marketplace ORDER BY listed_at DESC");
            while (rs.next()) {
                Map<String,String> i = new HashMap<>();
                i.put("type", rs.getString("vehicle_type"));
                i.put("model", rs.getString("model"));
                i.put("age", rs.getString("age"));
                i.put("accidents", rs.getString("accidents"));
                i.put("price", rs.getString("estimated_price"));
                items.add(i);
            }
        } catch (SQLException e) {
            throw new ServletException(e);
        }

        req.setAttribute("items", items);
        RequestDispatcher rd = req.getRequestDispatcher("service-buy.jsp");
        rd.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        // SELL form
        HttpSession session = req.getSession(false);
        if (session == null || session.getAttribute("userId") == null) {
            resp.sendRedirect("login.jsp");
            return;
        }

        int userId = (int) session.getAttribute("userId");
        String type = req.getParameter("vehicleType");
        String model = req.getParameter("model");
        int age = Integer.parseInt(req.getParameter("age"));
        String accidents = req.getParameter("accidents");

        // simple static pricing logic (you can enhance later)
        double estimated = (type.equalsIgnoreCase("car") ? 500000 : 70000) - (age * 20000);
        if ("yes".equals(accidents)) estimated -= 30000;
        if (estimated < 0) estimated = 20000;

        try (Connection con = DBUtil.getConnection()) {
            PreparedStatement ps = con.prepareStatement(
                "INSERT INTO marketplace (seller_id, vehicle_type, model, age, accidents, estimated_price) VALUES (?,?,?,?,?,?)");
            ps.setInt(1, userId);
            ps.setString(2, type);
            ps.setString(3, model);
            ps.setInt(4, age);
            ps.setString(5, accidents);
            ps.setDouble(6, estimated);
            ps.executeUpdate();
        } catch (SQLException e) {
            throw new ServletException(e);
        }

        req.setAttribute("message", "Vehicle listed successfully. Estimated price: ₹" + estimated);
        RequestDispatcher rd = req.getRequestDispatcher("service-sell.jsp");
        rd.forward(req, resp);
    }
}

