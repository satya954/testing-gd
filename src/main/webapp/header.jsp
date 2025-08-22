<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <title>GaadiDost</title>
  <!-- use contextPath so CSS loads from any page -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/style.css" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
</head>
<body>
<header>
  <div class="container">
    <h1 class="logo">GaadiDost</h1>
    <nav>
      <a href="${pageContext.request.contextPath}/welcome.jsp">Dashboard</a>
      <a href="${pageContext.request.contextPath}/about.jsp">About</a>
      <a href="${pageContext.request.contextPath}/contact.jsp">Contact</a>
      <%
        String user = (String) session.getAttribute("username");
        if (user != null) {
      %>
          <a href="${pageContext.request.contextPath}/logout.jsp" class="logout-link">Logout</a>
      <% } %>
    </nav>
  </div>
</header>

