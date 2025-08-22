<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="header.jsp" %>
<h2>Vehicles for Sale</h2>
<table>
  <tr><th>Type</th><th>Model</th><th>Age</th><th>Accidents</th><th>Price (₹)</th></tr>
  <c:forEach var="i" items="${items}">
    <tr>
      <td>${i.type}</td>
      <td>${i.model}</td>
      <td>${i.age}</td>
      <td>${i.accidents}</td>
      <td>${i.price}</td>
    </tr>
  </c:forEach>
</table>
<%@ include file="footer.jsp" %>

