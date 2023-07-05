<%@ page import="java.util.ArrayList" %>
<%@ page import="com.sirah.driveme.models.Order" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@include file="includes/header.jsp" %>
<main class="main">
    <div class="container">
        <div class="title-bar shadow">
            <h1 class="title">Orders</h1>
            <%
                if(loggedIn == null) {
            %>
            <p class="lead">Login to Create/Bid for orders. <a href="login">Login</a> </p>
            <% } %>
            <jsp:include page="includes/searchForm.jsp">
                <jsp:param name="action" value="orders?action=search"/>
                <jsp:param name="width" value="w-100"/>
            </jsp:include>
        </div>
    </div>
    <div class="container">
        <div class="row">
            <div class="d-none d-md-block col-md-4">
                <form action="orders?action=filter" method="get">
                    <div class="form-group">
                        <label for="region">Region</label>
                        <select name="region" id="region" class="form-control form-control-sm">
                            <option value="all">All</option>
                            <option value="region1">Region 1</option>
                            <option value="region1">Region 1</option>
                            <option value="region1">Region 1</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="pay">Pay Range</label>
                        <input type="range" class="form-control" name="pay" id="pay" min="1" step="100" max="100000">
                    </div>
                    <div class="form-group">
                        <label for="type">Vehicle Type</label>
                        <select name="type" id="type" class="form-control form-control-sm">
                            <option value="all">All</option>
                            <option value="A">Type A</option>
                            <option value="B">Type B</option>
                            <option value="C">Type C</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="expertise">Expert Level</label>
                        <select name="expertise" id="expertise" class="form-control form-control-sm">
                            <option value="all">All</option>
                            <option value="A">Beginner</option>
                            <option value="B">Moderate</option>
                            <option value="C">Expert</option>
                        </select>
                    </div>
                    <button class="btn btn-dark btn-sm" type="submit">Apply Filter</button>
                </form>
            </div>
            <div class="col-md-8">
                <%
                    ArrayList<Order> orders = (ArrayList<Order>) request.getAttribute("orders");
                    if(orders.size() > 0) {
                        for (Order order: orders) {
                %>
                <div class="card bg-transparent mb-2">
                    <div class="card-body">
                        <h3 class="card-title"><%=order.getTitle()%> Deadline <%=order.getDeadline()%></h3>
                        <p class="card-text"><%=order.getShortDesc()%></p>
                        <table class="table table-sm">
                            <tr>
                                <th>Expertise</th>
                                <th>Vehicle Type</th>
                                <th>Experience</th>
                                <th>Ages</th>
                                <th>Pay</th>
                                <th>Bids</th>
                                <th>Deadlines</th>
                            </tr>
                            <tr>
                                <td><%=order.getExpertise()%></td>
                                <td><%=order.getVehicleType()%></td>
                                <td><%=order.getExperience()%> Years</td>
                                <td><%=order.getAgeRange()%></td>
                                <td>Ksh <%=order.getPay()%></td>
                                <td>0</td>
                                <td><%=order.getDeadline()%></td>
                                <td>
                                    <a class="card-link" href="bid?action=bid&orderId=<%=order.getId()%>">Bid</a>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
                <% } }%>
            </div>
        </div>
    </div>
</main>
<%@include file="includes/footer.jsp" %>
