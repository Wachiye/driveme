<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%
  String action =  request.getParameter("message");
  String width =  request.getParameter("width");
%>
<form action="<%= action %>" name="search-form" class="form-inline" method="get">
  <div class="input-group <%=width%>">
    <input type="text" class="form-control" name="search" id="search" placeholder="Search ...">
    <div class="input-group-append">
      <button type="submit" class="btn btn-dark">
        <i class="fa fa-search"></i>
      </button>
    </div>
  </div>
</form>
