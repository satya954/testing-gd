package com.gaadidost;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

public class BookingServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String serviceType = request.getParameter("serviceType");
        String bookingDate = request.getParameter("bookingDate");

        try (Connection con = DBUtil.getConnection()) {
            String sql = "INSERT INTO bookings (username, service_type, booking_date) VALUES (?, ?, ?)";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, serviceType);
            ps.setString(3, bookingDate);

	    int rows = ps.executeUpdate();
	    if (rows > 0) {
    		request.setAttribute("service", serviceType);
    		request.setAttribute("date", bookingDate);
    		request.setAttribute("message", "Booking successful for " + serviceType + "!");
    		request.getRequestDispatcher("booking-success.jsp").forward(request, response);
	     } else {
    		request.setAttribute("message", "Booking failed. Please try again.");
    		request.getRequestDispatcher("booking-failure.jsp").forward(request, response);
	     }

        } catch (Exception e) {
            throw new ServletException("Booking failed", e);
        }
    }
}

