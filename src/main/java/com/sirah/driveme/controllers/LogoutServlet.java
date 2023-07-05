package com.sirah.driveme.controllers;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "LogoutServlet", value = "/logout")
public class LogoutServlet extends HttpServlet {
    private  void  processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        request.getSession().removeAttribute("user");
        request.getSession().removeAttribute("loggedIn");
        request.getSession().invalidate();
        response.sendRedirect("./");
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       processRequest(request, response);
    }
}
