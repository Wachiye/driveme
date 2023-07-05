package com.sirah.driveme.controllers;

import com.sirah.driveme.dao.UserDAO;
import com.sirah.driveme.models.User;
import com.sirah.driveme.utils.Functions;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet( name = "LoginServlet", value = "/login")
public class LoginServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Boolean loggedIn = (Boolean) request.getSession().getAttribute("loggedIn");

        if(loggedIn != null && loggedIn){
            response.sendRedirect("dashboard");
        }
        else{
            String loginRoute = "login.jsp";
            RequestDispatcher dispatcher = request.getRequestDispatcher(loginRoute);
            dispatcher.forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String loginRoute = "login.jsp"; //redirect route on error
        String message = "";
        String messageType = "";
        Boolean redirect = false;

        RequestDispatcher dispatcher = request.getRequestDispatcher(loginRoute);

        //get email and password
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        //validate email and password
        if( email.length() == 0 || password .length() == 0){
            message = "Error: Email/Password missing.";
            messageType = "error";
        } else{
            // try login
            User user = new UserDAO().getUserByEmail(email, getUserDataFilePath(request));

            if( user != null){
                String userPassword = user.getPassword();
                //compare given password with saved password
                boolean passwordMatch = Functions.compareEncrypted( userPassword, password);

                if(user.getEmail().equals(email) && passwordMatch){
                    //set session cookie
//                    final int ONE_WEEK = 60 * 60 * 24 * 7;
//                    Cookie emailCk = new Cookie("email", email);
//                    emailCk.setMaxAge(ONE_WEEK);
//                    Cookie userTypeCk = new Cookie("userType", user.getUserType());
//                    userTypeCk.setMaxAge(ONE_WEEK);
//                    Cookie loggedInCk = new Cookie("loggedIn", "loggedIn");
//                    loggedInCk.setMaxAge(ONE_WEEK);
//                    response.addCookie(emailCk);
//                    response.addCookie(userTypeCk);
//                    response.addCookie(loggedInCk);
                    HttpSession session = request.getSession();
                    session.setAttribute("user", user);
                    session.setAttribute("userType", user.getUserType());
                    session.setAttribute("loggedIn", true);
                    session.setMaxInactiveInterval(30000);

                    redirect = true;
                }
                else {
                    request.setAttribute("email", email);
                    message = "Login failed. Email/Password don't match.";
                    messageType = "error";
                }
            } else{
                message = "Login failed. Invalid credentials";
                messageType = "error";
            }
        }

        request.setAttribute("message", message);
        request.setAttribute("messageType", messageType);

        if( redirect)
            response.sendRedirect("dashboard");
        else
            dispatcher.forward( request, response);
    }
    //returns the absolute path of the users data file
    private String getUserDataFilePath(HttpServletRequest request){
        String userDataFile = "WEB-INF/data/users.txt";
        ServletContext servletContext = request.getServletContext();
        return servletContext.getRealPath(userDataFile);
    }
}
