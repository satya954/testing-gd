<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%
    HttpSession sessionObj = request.getSession(false);
    if (sessionObj == null || sessionObj.getAttribute("username") == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<%@ include file="header.jsp" %>
<%@ include file="sidebar.jsp" %>

<div class="card">
    <h2>🔧 Vehicle Repair</h2>
    <p>Book a Repair for your vehicle.</p>

    <form action="BookingServlet" method="post">
        <input type="hidden" name="service" value="Repair">
        <label>Select Vehicle:</label>
        <select name="vehicleId" required>
            <option value="">--Choose Vehicle--</option>
            <!-- populate from DB later -->
        </select>

        <label>Date:</label>
        <input type="date" name="date" required>

        <button type="submit" class="cta-btn full-width">Book Repair</button>
    </form>
</div>

<%@ include file="footer.jsp" %>
