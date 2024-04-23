<%@ page import="dtos.AccountDTO" %><%--
    Document   : orderpage
    Created on : Feb 26, 2024, 8:38:15 PM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
    <%
        if(session.getAttribute("account") == null){
            response.sendRedirect("login");
        } else {
            AccountDTO account = (AccountDTO) session.getAttribute("account");
            if(account.getType() == 1){
    %>
    <jsp:include page="header.jsp" />
    <%
    } else if ( account.getType() == 2) {
    %>
    <jsp:include page="header-user.jsp" />
    <%
            }
        }
    %>
    <div class="container">
        <br/>
        <h1>Change Password</h1>

            <br/>
        <th:if test="${message != null}">
            <p>${message}</p>
        </th:if>
        <form action="./change-password" method="post">
            <table>
                <th:set var="account" value="${sessionScope.account}" />
                <tbody>
                <tr>
                    <td>Old password</td>
                    <td style="padding: 5px 10px;"><input type="text" name="password" value="${param.password}" required/></td>
                </tr>
                <tr>
                    <td>New password</td>
                    <td style="padding: 5px 10px;"><input type="text" name="newPassword" value="${param.newPassword}" required/></td>
                </tr>
                <tr>
                    <td>Confirm password</td>
                    <td style="padding: 5px 10px;"><input type="text" name="confirmPassword" value="${param.confirmPassword}" required /></td>
                </tr>

                <td></td>
                <td><input type="submit" value="Save" style="color: white; background: #333; padding: 5px; border-radius: 5px; cursor: pointer"/></td>
                </tr>
                </tbody>
            </table>
        </form>
    </div>
    </body>
</html>
