<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="header.jsp" %>
<h2>My Bookings</h2>
<table>
  <tr><th>Service</th><th>Option</th><th>Scheduled</th><th>Booked On</th><th>Notes</th></tr>
  <c:forEach var="b" items="${bookings}">
    <tr>
      <td>${b.type}</td>
      <td>${b.option}</td>
      <td>${b.scheduled}</td>
      <td>${b.date}</td>
      <td>${b.notes}</td>
    </tr>
  </c:forEach>
</table>
<%@ include file="footer.jsp" %>

