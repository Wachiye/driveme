<%@ page import="com.sirah.driveme.models.User" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@include file="includes/header.jsp" %>
<div class="main admin-main">
    <div class="client-dashboard">
        <div class="p-1 shadow d-flex justify-content-between align-item-center">
            <h3>Orders</h3>
            <jsp:include page="includes/searchForm.jsp">
                <jsp:param name="action" value="orders?action=search"/>
                <jsp:param name="width" value="w-auto"/>
            </jsp:include>
            <a href="orders?action=create" class="btn btn-outline-primary shadow">Create Order</a>
        </div>
        <div class="container">
            <div class="row">
                dic.card
            </div>
        </div>
    </div>
</div>
<%@include file="includes/footer.jsp" %>