package com.sirah.driveme.controllers;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "DashboardServlet", value = {"/dashboard"})
public class DashboardServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //check if user is logged in
        Boolean loggedIn = (Boolean) request.getSession().getAttribute("loggedIn");

        if(loggedIn != null && loggedIn){
            String dashboardRoute = "dashboard.jsp";
            RequestDispatcher dispatcher = request.getRequestDispatcher(dashboardRoute);
            dispatcher.forward(request, response);
        }else{
            response.sendRedirect("login");
        }

    }
}
