package com.sirah.driveme.controllers;

import com.sirah.driveme.dao.MessageDAO;
import com.sirah.driveme.models.Message;
import com.sirah.driveme.utils.Functions;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "ContactServlet", value = "/contact")
public class ContactServlet extends HttpServlet {
    String contactRoute ;
    private String message;
    private String messageType;

    public void init(){
        contactRoute = "contact.jsp"; //redirect route
        message = "";
        messageType = "";
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher(contactRoute);
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //get submitted user data
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String email = request.getParameter("email");
        String msgText = request.getParameter("message");
        String status = "unread";
        //generate UUID
        String msgId = Functions.generateUUID();
        Message msg = new Message(msgId, firstName, lastName, email, msgText, status);

        request.setAttribute("msg", msg);

        //validate inputs
        if(firstName.length() == 0 || lastName.length() == 0 || email.length() == 0 || msgText.length() == 0){
            message = "Error: Missing data. Please enter all required fields.";
            messageType = "error";
        } else {

            //save message
            if(MessageDAO.insert( msg, getMessageDataFilePath(request))){
                //send email to user to notify them that the message was received

                message = "Received. Your message has been received and will be processed along others.You will receive an email upon responding to your message. Thank you for using DriveMe";
                messageType = "success";
            } else{
                message = "Error: Sorry, but we could complete your request at the moment. Try again later";
                messageType = "error";
            }
        }
        request.setAttribute("message", message);
        request.setAttribute("messageType", messageType);

        String loginRoute = "contact.jsp";
        RequestDispatcher dispatcher = request.getRequestDispatcher(loginRoute);
        dispatcher.forward(request, response);
    }

    //returns the absolute path of the messages data file
    private String getMessageDataFilePath(HttpServletRequest request){
        String userDataFile = "WEB-INF/data/messages.txt";
        ServletContext servletContext = request.getServletContext();
        return servletContext.getRealPath(userDataFile);
    }
}
