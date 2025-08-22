<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="header.jsp" %>
<h2>Upcoming Schedules</h2>
<ul>
  <c:forEach var="s" items="${schedules}">
    <li>${s.type} - ${s.option} on ${s.scheduled}</li>
  </c:forEach>
</ul>
<%@ include file="footer.jsp" %>

