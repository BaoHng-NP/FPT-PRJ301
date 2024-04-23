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
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <!------ Include the above in your HEAD tag ---------->
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">

    </head>
    <body>

            <%
                if (session.getAttribute("account") == null) {
                    response.sendRedirect("login");
                } else {
                    AccountDTO account = (AccountDTO) session.getAttribute("account");
                    if (account.getType() == 1) {
            %>
            <jsp:include page="header.jsp" />
            <%
            } else if (account.getType() == 2) {
            %>
            <jsp:include page="header-user.jsp" />
            <%
                    }
                }
            %>
        <div class="container">
            <br/>
            <h1>My Account</h1>
            <br/>

            <form action="./edit-member" method="post">
                <table>
                    <th:set var="account" value="${sessionScope.account}" />
                    <tbody>
                        <tr>
                            <td>AccountID</td>
                            <td style="padding: 5px 10px;"><input type="text" name="accountId" value="${account.accountId}" readonly/></td>
                        </tr>
                        <tr>
                            <td>Username</td>
                            <td style="padding: 5px 10px;"><input type="text" name="username" value="${account.username}" required/></td>
                        </tr>

                    <td ><input type="hidden" name="password" value="${account.password}" required /></td>
                    <tr>
                        <td>Full Name</td>
                        <td style="padding: 5px 10px;"><input type="text" name="fullName" value="${account.fullName}" required /></td>
                    </tr>
                    <input type="hidden" name="type" value="${account.type}" required />


                    <td></td>
                    <td><input type="submit" value="Save" style="color: white; background: #333; padding: 5px; border-radius: 5px; cursor: pointer"/></td>
                    </tr>
                    </tbody>
                </table>
            </form>

            <br/>
            <br/>
            <a href="./change-password">Change password</a><br>
            <a href="UpdateCustomer">Change Customer info</a>
            <h2>${msg}</h2>
        </div>
    </body>
</html>
