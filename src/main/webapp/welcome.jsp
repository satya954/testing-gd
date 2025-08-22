<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="javax.servlet.http.*" %>
<%
  HttpSession s = request.getSession(false);
  if (s == null || s.getAttribute("username") == null) {
      response.sendRedirect("login.jsp");
      return;
  }
  String username = (String) s.getAttribute("username");
%>
<%@ include file="header.jsp" %>
<%@ include file="sidebar.jsp" %>

<div class="dashboard">
  <h2>Welcome, <%= username %> 👋, Here are Available Services</h2>
  <div class="service-cards">
    <a href="service-wash.jsp" class="service-card">🚿 Book a Wash</a>
    <a href="service-repair.jsp" class="service-card">🔧 Book a Repair</a>
    <a href="service-oil.jsp" class="service-card">🛢️ General Service</a>
    <a href="service-buy.jsp" class="service-card">💰 Buy Vehicle</a>
    <a href="service-sell.jsp" class="service-card">📤 Sell Vehicle</a>
  </div>
</div>

<%@ include file="footer.jsp" %>

