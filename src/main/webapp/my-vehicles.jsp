<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="header.jsp" %>
<h2>My Vehicles</h2>
<table>
  <tr><th>Name</th><th>Type</th><th>Reg No</th></tr>
  <c:forEach var="v" items="${vehicles}">
    <tr>
      <td>${v.name}</td>
      <td>${v.type}</td>
      <td>${v.regno}</td>
    </tr>
  </c:forEach>
</table>
<%@ include file="footer.jsp" %>

