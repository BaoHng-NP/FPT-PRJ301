<%-- 
    Document   : Update-Customer
    Created on : Mar 13, 2024, 12:36:02 AM
    Author     : baohu
--%>

<%@page import="dtos.AccountDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
            <h1>Update Customer</h1>
            <br/>
            <th:if test="${message != null}">
                <p>${message}</p>
            </th:if>
            <form action="UpdateCustomer" method="post">
                <table>
                    <th:set var="account" value="${sessionScope.account}" />
                    <tbody>
                        <tr>
                            <td>Contact Name</td>
                            <td style="padding: 5px 10px;"><input type="text" name="contactName" value="${param.contactName}" required></td>
                        </tr>
                        <tr>
                            <td>Address</td>
                            <td style="padding: 5px 10px;"><input type="text" name="address" value="${param.address}" required></td>
                        </tr>
                        <tr>
                            <td>Phone</td>
                            <td style="padding: 5px 10px;"><input type="number" name="phone" value="${param.phone}" required /></td>

                            <td></td>
                            <td><input type="submit" value="Save" style="color: white; background: #333; padding: 5px; border-radius: 5px; cursor: pointer"/></td>
                        </tr>
                    </tbody>
                </table>
            </form>
        </div>
    </body>
</html>
