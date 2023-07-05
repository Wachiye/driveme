<%@ page import="com.sirah.driveme.models.User" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@include file="includes/header.jsp" %>
<div class="main admin-main">
    <div class="dashboard">
        <div class="p-1 shadow d-flex justify-content-between align-item-center">
            <h3>Dashboard</h3>
        </div>
        <%
            String userType = (String) session.getAttribute("userType");
            User user = (User) session.getAttribute("user");

            if(userType != null && userType.equalsIgnoreCase("admin")) {
        %>
        <jsp:include page="includes/admin-dashboard.jsp"/>
        <% } else {%>
        <jsp:include page="includes/user-dashboard.jsp"/>
        <% } %>
    </div>
</div>
<%@include file="includes/footer.jsp" %>