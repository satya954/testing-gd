<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="header.jsp" %>
<h2>Sell Your Vehicle</h2>
<c:if test="${not empty message}">
  <p style="color:green">${message}</p>
</c:if>
<form action="MarketplaceServlet" method="post">
  <label>Type:
    <select name="vehicleType">
      <option value="car">Car</option>
      <option value="bike">Bike</option>
      <option value="scooter">Scooter</option>
    </select>
  </label><br>
  <label>Model: <input type="text" name="model"/></label><br>
  <label>Age (years): <input type="number" name="age" min="0"/></label><br>
  <label>Accidents:
    <select name="accidents">
      <option value="no">No</option>
      <option value="yes">Yes</option>
    </select>
  </label><br>
  <button type="submit">Submit</button>
</form>
<%@ include file="footer.jsp" %>

