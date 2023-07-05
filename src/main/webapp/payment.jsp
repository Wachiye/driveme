<%--
  Created by IntelliJ IDEA.
  User: sirah
  Date: 29/07/2021
  Time: 14:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<h3 class="text-primary">Payment</h3>
<p class="lead">Payment gateway is the method through which you will receive your payments</p>
<form class="mx-auto" action="profile?action=pay&id=<%= user.getId()%>" method="post">
  <jsp:include page="includes/alert.jsp" />
  <div class="form-group">
    <label for="gateway">Payment Gateway</label>
    <select name="gateway" id="gateway" class="form-control">
      <option value="paypal">PayPal</option>
      <option value="mpesa">Mpesa</option>
    </select>
  </div>
  <div class="form-group">
    <label for="gatewayId">Gateway ID</label>
    <input class="form-control" type="text" name="gatewayId" id="gatewayId" placeholder="Gateway Id">
    <span class="text-info form-text small">Paypal Email / Mpesa Phone Number</span>
  </div>
  <button class="btn btn-dark btn-sm" type="submit" name="pay-button" id="pay-button">Change Gateway</button>
</form>
