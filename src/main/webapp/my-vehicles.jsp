<h2>My Vehicles</h2>
<table>
  <tr><th>Vehicle</th><th>Type</th><th>Reg No</th></tr>
  <%
    List<Vehicle> vehicles = (List<Vehicle>) request.getAttribute("vehicles");
    if (vehicles != null) {
      for (Vehicle v : vehicles) {
  %>
    <tr>
      <td><%= v.getName() %></td>
      <td><%= v.getType() %></td>
      <td><%= v.getRegNo() %></td>
    </tr>
  <% }} %>
</table>

