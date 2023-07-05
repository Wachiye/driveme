package com.sirah.driveme.controllers;

import com.sirah.driveme.dao.OrderDAO;
import com.sirah.driveme.dao.UserDAO;
import com.sirah.driveme.models.Order;
import com.sirah.driveme.models.User;
import com.sirah.driveme.utils.Functions;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;

@WebServlet(name = "OrderServlet", value = "/orders")
public class OrderServlet extends HttpServlet {
    private final String adminOrdersRoute = "admin-orders.jsp";
    private final String clientOrdersRoute = "client-orders.jsp";
    private final String createOrderRoute = "create-order.jsp";
    private final String ordersRoute = "orders.jsp";
    
    private String url;
    private String message;
    private String messageType;

    private ArrayList<Order> orders = null;
    
    public void init(){
        url = ordersRoute ;
        message = "";
        messageType = "";
        orders = new ArrayList<>();
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //get action and id parameters
        String action = request.getParameter("action");
        String id = request.getParameter("id");

        orders = OrderDAO.getOrders(getOrderDataFilePath());

        //check user is logged in
        if(Functions.isLoggedIn(request)){
            checkLoginAndProcess(request, response, action, id);
        }
        else{
            url = ordersRoute;
        }

        if (orders.size() == 0 && (action != null && !action.equals("create"))) {
            message ="Oops!No Orders were found. Try again later";
            messageType= "info";
            request.setAttribute("orders", null);
        } else {
            request.setAttribute("orders", orders);
        }


        request.setAttribute("message", message);
        request.setAttribute("messageType", messageType);

        //redirect to page
        if(url.equals("/orders") || url.equals("/login"))
            response.sendRedirect( request.getContextPath() + url);
        else
            goToRoute(request, response);
    }

    protected void checkLoginAndProcess(HttpServletRequest request, HttpServletResponse response, String action, String id) throws ServletException, IOException{
        //check if user if logged in as admin or client
        Boolean isClient = Functions.checkLoggedInAs("client",request);
        Boolean isAdmin = Functions.checkLoggedInAs("admin",request);

        if(action == null && isAdmin){
            url = adminOrdersRoute;
        } else if( action == null && isClient){
            // get orders associated to client and set url to clientOrdersRoute
            User user = (User) request.getSession().getAttribute("user");
            orders = OrderDAO.getOrdersByClientId(user.getId(), getOrderDataFilePath());
            url = clientOrdersRoute;
        } else if (action != null && action.equals("create")){
            url = createOrderRoute;
        } else if(action != null && (isClient || isAdmin)) {
            //process edit or delete request
            processRequest(request, response);
        }else {
            url = ordersRoute;
        }
    }
    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        String action = request.getParameter("action");
        String id = request.getParameter("id");

        //get order by id
        Order order = OrderDAO.getOrder(id, getOrderDataFilePath());

        if(action.equals("edit")) {
            request.setAttribute("order", order);
            url = createOrderRoute;
        } else if(action.equals("delete")){
            //get the order with the given id and redirect
            if (OrderDAO.delete(order, getOrderDataFilePath())) {
                message = "Order deleted successfully";
                messageType = "success";
            } else {
                message = "Error: Sorry but we could not complete your request at the moment. Try again later";
                messageType = "error";
            }
            url = "/orders";
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //check if user is logged in
        if( Functions.isLoggedIn(request)) {
            //clients can only upload orders if they are logged in
            if (Functions.checkLoggedInAs("client", request)) {
                /**
                 * should check if client is verified here
                 */
                //get data from request
                String id = Functions.generateUUID();
                User user = (User) request.getSession().getAttribute("user");
                String clientId = user.getId();
                String title = request.getParameter("title");
                String shortDesc = request.getParameter("shortDesc");
                String longDesc = request.getParameter("longDesc");
                String expertise = request.getParameter("expertise");
                String vehicleType = request.getParameter("vehicleType");
                String experience = request.getParameter("experience");
                String ageRange = request.getParameter("ageRange");
                double pay = Double.parseDouble(request.getParameter("pay"));
                String uploadDate = Functions.getDateToday();
                String deadline = request.getParameter("deadline");
                String status = request.getParameter("status");

                Order order = new Order(id, clientId, title, shortDesc, longDesc, expertise, vehicleType, experience, ageRange, pay, uploadDate, deadline, status);

                // validate input
                if (clientId.length() == 0 || title.length() == 0 || shortDesc.length() == 0 ||
                        longDesc.length() == 0 || expertise.length() == 0 || vehicleType.length() == 0 ||
                        experience.length() == 0 || ageRange.length() == 0 || pay == 0 ||
                        deadline.length() == 0) {
                    message = "Error: Missing data. Please enter all required fields.";
                    messageType = "error";
                    request.setAttribute("order", order);
                } else {

                    ServletContext sc = request.getServletContext();
                    String userDataFile = "WEB-INF/data/users.txt";
                    String userDataFilePath = sc.getRealPath(userDataFile);

                    //check if client exists
                    if (UserDAO.getUser(clientId, userDataFilePath) != null) {
                        //insert order
                        if (OrderDAO.insert(order, getOrderDataFilePath())) {
                            message = "Success. Your order has been placed and is open for bids.";
                            messageType = "success";
                            request.setAttribute("orderId", id);
                        } else {
                            //error while inserting order
                            message = "Error: Sorry, but we could not create your order at the moment.Try again later.";
                            messageType = "error";
                        }
                    } else {
                        //client does not exists
                        message = "Error: Client with id " + clientId + " does not exist or is not verified.";
                        messageType = "error";
                    }
                }
            } else {
                // userType is not client
                message = "Request Denied. Only verified clients can make orders.";
                messageType = "error";
            }
            url = createOrderRoute;
            request.setAttribute("message", message);
            request.setAttribute("messageType", messageType);
            goToRoute(request, response);
        }
        else{
            //user not logged in: redirect to login
            response.sendRedirect("login");
        }
    }

    private void goToRoute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher(url);
        dispatcher.forward(request, response);
    }

    //returns the absolute path of the orders data file
    private String getOrderDataFilePath(){
        String userDataFile = "WEB-INF/data/orders.txt";
        ServletContext servletContext = getServletContext();
        return servletContext.getRealPath(userDataFile);
    }
}
