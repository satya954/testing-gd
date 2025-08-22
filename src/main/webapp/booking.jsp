<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String selectedService = request.getParameter("service");
    if (selectedService == null) {
        selectedService = "";
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Book Service - GaadiDost</title>
    <link rel="stylesheet" href="style.css"/>
</head>
<body>
<header>
    <div class="navbar">
        <div class="logo">GaadiDost</div>
        <nav>
            <ul>
                <li><a href="welcome.jsp">Home</a></li>
                <li><a href="logout">Logout</a></li>
            </ul>
        </nav>
    </div>
</header>

<section class="booking-form">
    <h2>Book Your Service</h2>
    <form action="booking" method="post">
        <label for="name">Full Name:</label>
        <input type="text" name="name" id="name" required>

        <label for="contact">Contact Number:</label>
        <input type="text" name="contact" id="contact" required>

        <label for="vehicle">Vehicle Details:</label>
        <input type="text" name="vehicle" id="vehicle" required>

        <label for="service">Select Service:</label>
        <select name="service" id="service" required>
            <option value="" disabled <%= selectedService.isEmpty() ? "selected" : "" %>>-- Select --</option>
            <option value="Washing" <%= "Washing".equals(selectedService) ? "selected" : "" %>>Washing</option>
            <option value="Repair" <%= "Repair".equals(selectedService) ? "selected" : "" %>>Repair</option>
            <option value="Engine Oil Change" <%= "Engine Oil Change".equals(selectedService) ? "selected" : "" %>>Engine Oil Change</option>
            <option value="Buy & Sell" <%= "Buy & Sell".equals(selectedService) ? "selected" : "" %>>Buy & Sell</option>
        </select>

        <button type="submit" class="btn">Submit Booking</button>
    </form>
</section>

</body>
</html>

