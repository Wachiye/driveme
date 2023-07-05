package com.sirah.driveme.controllers;

import com.sirah.driveme.dao.UserDAO;
import com.sirah.driveme.models.User;
import com.sirah.driveme.utils.Functions;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "UserServlet", value = "/users")
public class UserServlet extends HttpServlet {
    private String loginRoute;
    private String message;
    private String messageType;

    public void init(){
        loginRoute = "login.jsp"; //redirect route on error
        message = "";
        messageType = "";
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    //returns the absolute path of the users data file
    private String getUserDataFilePath(HttpServletRequest request){
        String userDataFile = "data/users.txt";
        ServletContext servletContext = request.getServletContext();
        return servletContext.getRealPath(userDataFile);
    }
}
