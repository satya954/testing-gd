<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    session.invalidate();  // clear all session data
    response.sendRedirect("index.jsp"); // back to index
%>
