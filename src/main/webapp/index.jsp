<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="javax.servlet.http.*" %>
<%
  HttpSession s = request.getSession(false);
  if (s != null && s.getAttribute("username") != null) {
      response.sendRedirect("welcome.jsp");
      return;
  }
%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <title>GaadiDost</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/style.css" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
</head>
<body>
<header>
  <div class="container">
    <h1 class="logo">GaadiDost</h1>
    <nav>
      <a href="${pageContext.request.contextPath}/login.jsp" class="btn">Login</a>
      <a href="${pageContext.request.contextPath}/signup.jsp" class="btn">Sign Up</a>
    </nav>
  </div>
</header>

<section class="hero home-hero">
  <h2>Everything for your vehicle, in one place</h2>
  <p>Wash • Repair • Oil Change • Buy & Sell. Book services, manage vehicles, and track schedules with GaadiDost.</p>
  <a class="cta-btn" href="${pageContext.request.contextPath}/login.jsp">Get Started</a>
</section>

<section class="main-content" style="margin-left:0;">
  <div class="card">
    <h2>About GaadiDost</h2>
    <p>We make automobile care simple and hassle-free. Create an account, add your vehicles, and book services in a few clicks.</p>
  </div>
</section>

<footer>
  <p>&copy; 2025 GaadiDost. All Rights Reserved.</p>
</footer>
</body>
</html>
