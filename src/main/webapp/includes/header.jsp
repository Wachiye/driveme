<%@ page import="jakarta.servlet.http.HttpSession" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/driveme.css">
    <link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon">
    <title>DriveMe</title>
</head>
<body>
    <div class="wrapper">
        <header class="header">
                <%
                    Boolean loggedIn = (Boolean) session.getAttribute("loggedIn");
                %>
                <nav class="navbar navbar-expand-md navbar-dark bg-dark">
                    <div class="container">
                        <a href="./" class="navbar-brand">DriveMe</a>
                        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbar">
                            <i class="fa fa-bars"></i>
                        </button>
                        <div class="collapse navbar-collapse" id="navbar">
                            <%
                                if( loggedIn != null && loggedIn){
                            %>
                            <jsp:include page="includes/loggedNav.jsp"/>
                            <% } else { %>
                            <ul class="navbar-nav ml-auto">
                                <li class="nav-item">
                                    <a href="./" class="nav-link">Home</a>
                                </li>
                                <li class="nav-item">
                                    <a href="about" class="nav-link">About</a>
                                </li>
                                <li class="nav-item">
                                    <a href="orders" class="nav-link">Orders</a>
                                </li>
                                <li class="nav-item">
                                    <a href="contact" class="nav-link">Contact</a>
                                </li>
                                <li class="nav-item">
                                    <a href="login" class="nav-link">Login</a>
                                </li>
                                <li class="nav-item">
                                    <a href="register" class="nav-link">Register</a>
                                </li>
                            </ul>
                            <% } %>

                        </div>
                    </div>
                </nav>
        </header>
                