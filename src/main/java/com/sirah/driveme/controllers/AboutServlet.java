package com.sirah.driveme.controllers;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "AboutServlet", value = "/about")
public class AboutServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String dashboardRoute = "about.jsp";
        RequestDispatcher dispatcher = request.getRequestDispatcher(dashboardRoute);
        dispatcher.forward(request, response);
    }
}
