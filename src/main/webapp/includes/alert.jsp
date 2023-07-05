<%--
  Created by IntelliJ IDEA.
  User: sirah
  Date: 22/07/2021
  Time: 23:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%
  String message =  (String) request.getAttribute("message");
  String messageType =  (String) request.getAttribute("messageType");

  if(messageType != null && messageType.equals("error"))
    messageType = "danger";
%>
<% if((message != null && !message.equals("")) && (messageType != null && !messageType.equals(""))){ %>
<div class="alert alert-dismissible alert-<%= messageType %> fade-out" id="alert">
  <p><%= message%></p>
  <button class="close" data-dismiss="alert" data-target="#alert">&times;</button>
</div>
<% } %>
