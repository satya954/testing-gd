<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.HttpSession" %>
<%
    HttpSession session = request.getSession(false);
    if (session == null || session.getAttribute("username") == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    String username = (String) session.getAttribute("username");
    String service = (String) request.getAttribute("service");
    String date = (String) request.getAttribute("date");
    String message = (String) request.getAttribute("message");
%>
<!DOCTYPE html>
<html>
<head>
    <title>Booking Successful - GaadiDost</title>
    <link rel="stylesheet" href="style.css"/>
</head>
<body>
<header>
    <div class="navbar">
        <div class="logo">GaadiDost</div>
        <nav>
            <ul>
                <li><a href="welcome.jsp">Home</a></li>
                <li><a href="booking.jsp">Book Service</a></li>
                <li><a href="logout">Logout</a></li>
            </ul>
        </nav>
    </div>
</header>

<section class="booking-success">
    <h2><%= message %></h2>
    <p>Thank you, <b><%= username %></b>! Your booking has been successfully placed.</p>

    <div class="booking-details">
        <p><strong>Service:</strong> <%= service %></p>
        <p><strong>Date:</strong> <%= date %></p>
    </div>

    <a href="welcome.jsp" class="btn">Go to Home</a>
</section>

</body>
</html>

