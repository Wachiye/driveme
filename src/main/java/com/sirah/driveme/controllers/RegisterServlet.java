package com.sirah.driveme.controllers;

import com.sirah.driveme.dao.UserDAO;
import com.sirah.driveme.models.User;
import com.sirah.driveme.utils.Functions;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "RegisterServlet", value = "/register")
public class RegisterServlet extends HttpServlet {
    private String registerRoute;
    private String message;
    private String messageType;

    public void init(){
        registerRoute = "register.jsp"; //redirect route
        message = "";
        messageType = "";
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher(registerRoute);
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //get submitted user data
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String userType = request.getParameter("userType");

        //generate UUID
        String userId = Functions.generateUUID();
        User user = new User(userId, firstName, lastName, username, email, password, userType);

        request.setAttribute("user", user);

        //validate inputs
        if(firstName.length() == 0 || lastName.length() == 0 || email.length() == 0 ||
                username.length() == 0 || password.length() == 0 || userType.length() == 0){
            message = "Error: Missing data. Please enter all required fields.";
            messageType = "error";
        } else {
            //check if email exist
            boolean emailExists = UserDAO.emailExists(email, getUserDataFilePath(request));

            if (emailExists) {
                message = "Error: Email already exists. Request password reset instead or use a different email.";
                messageType = "error";
            } else{

                //encrypt password
                String pwd = Functions.encryptString(password);
                user.setPassword(pwd);

                //save user
                if(UserDAO.insert( user, getUserDataFilePath(request))){
                    message = "Congratulations: Your DriveMe account was created successfully. Login to complete profile";
                    messageType = "success";
                } else{
                    message = "Error: Sorry, but we could not create your DriveMe Account at the moment.Try again later.";
                    messageType = "error";
                }

            }
        }
        request.setAttribute("message", message);
        request.setAttribute("messageType", messageType);

        String loginRoute = "register.jsp";
        RequestDispatcher dispatcher = request.getRequestDispatcher(loginRoute);
        dispatcher.forward(request, response);
    }

    //returns the absolute path of the users data file
    private String getUserDataFilePath(HttpServletRequest request){
        String userDataFile = "WEB-INF/data/users.txt";
        ServletContext servletContext = request.getServletContext();
        return servletContext.getRealPath(userDataFile);
    }
}
