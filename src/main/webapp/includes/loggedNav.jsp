<%@ page import="com.sirah.driveme.models.User" %><%--
  Created by IntelliJ IDEA.
  User: sirah
  Date: 25/07/2021
  Time: 17:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<ul class="navbar-nav ml-auto">
    <li class="nav-item">
        <a href="dashboard" class="nav-link">Dashboard</a>
    </li>
    <li class="nav-item">
        <a href="orders" class="nav-link">Orders</a>
    </li>
    <li class="nav-item">
        <a href="payments" class="nav-link">Payments</a>
    </li>
    <li class="nav-item">
        <a href="notifications" class="nav-link">Notifications</a>
    </li>
    <%
        String userType = (String) session.getAttribute("userType");
        User user = (User) session.getAttribute("user");

        if(userType != null && userType.equalsIgnoreCase("admin")) {
    %>
    <li class="nav-item">
        <a href="users" class="nav-link">Users</a>
    </li>
    <li class="nav-item">
        <a href="messages" class="nav-link">Messages</a>
    </li>
    <% } else { %>
    <li class="nav-item">
        <a href="contact" class="nav-link">Contact</a>
    </li>
    <% } %>
    <li class="nav-item">
        <a href="profile" class="nav-link">
            <i class="fa fa-user"></i>
            <%= user.getUserType() + ":@" + user.getUsername()%></a>
    </li>
    <li class="nav-item">
        <a href="logout" class="nav-link">Logout</a>
    </li>
</ul>
