<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="header.jsp" %>
<h2>Book a Wash Service</h2>
<form action="BookingServlet" method="post">
  <input type="hidden" name="serviceType" value="wash" />
  <label>Type:
    <select name="serviceOption">
      <option value="normal">Normal</option>
      <option value="foam">Foam</option>
      <option value="oil">Oil</option>
    </select>
  </label><br>
  <label>Schedule: <input type="datetime-local" name="scheduledFor" /></label><br>
  <textarea name="notes" placeholder="Any notes"></textarea><br>
  <button type="submit">Book Now</button>
</form>
<%@ include file="footer.jsp" %>

