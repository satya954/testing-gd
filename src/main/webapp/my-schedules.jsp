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
    <h2>📅 Upcoming Schedules</h2>
    <p>Track all your upcoming service appointments here:</p>

    <!-- Placeholder: integrate DB fetch -->
    <ul class="list">
        <li>No upcoming schedules yet.</li>
    </ul>
</div>

<%@ include file="footer.jsp" %>

