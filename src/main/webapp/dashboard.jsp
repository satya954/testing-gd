<%@ page session="true" %>
<%
    String username = (String) session.getAttribute("username");
    if (username == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Dashboard - GaadiDost</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>

<!-- Sidebar -->
<div class="sidebar">
    <h2>GaadiDost</h2>
    <a href="my-vehicles.jsp">🚗 My Vehicles</a>
    <a href="my-bookings.jsp">📋 My Previous Bookings</a>
    <a href="my-schedules.jsp">📅 Upcoming Schedules</a>
</div>

<!-- Main content -->
<div class="main">
    <header>
        <h1>Welcome, <%= username %> 👋</h1>
        <a href="logout.jsp" class="logout">Logout</a>
    </header>
</div>

</body>
</html>

