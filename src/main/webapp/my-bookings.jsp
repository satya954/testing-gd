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
    <h2>📜 My Previous Bookings</h2>
    <p>Below are your past bookings history:</p>

    <!-- Placeholder: integrate DB fetch -->
    <table class="styled-table">
        <thead>
            <tr>
                <th>Service</th>
                <th>Vehicle</th>
                <th>Date</th>
                <th>Status</th>
            </tr>
        </thead>
        <tbody>
            <tr><td colspan="4">No previous bookings found.</td></tr>
        </tbody>
    </table>
</div>

<%@ include file="footer.jsp" %>
