<%-- 
    Document   : HomePage
    Created on : Jan 24, 2024, 10:37:30 AM
    Author     : baohu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Info</title>
    </head>
    <body>
        <div class="container">
        <h1><%=request.getAttribute("action")%></h1>
        <%
            String message = (String)request.getAttribute("message");
            if (message != null) {
        %>
        <h3><%=message%></h3>
        <% }
        %>
        <a href=<%=request.getAttribute("page")%>>Back</a></br>
        </div>
        
    </body>
</html>
