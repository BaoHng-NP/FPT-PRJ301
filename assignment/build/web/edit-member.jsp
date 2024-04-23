<%@ taglib prefix="th" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
    Document   : create-pizza
    Created on : Feb 25, 2024, 7:20:19 PM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/boxicons/2.1.0/css/boxicons.min.css" integrity="sha512-pVCM5+SN2+qwj36KonHToF2p1oIvoU3bsqxphdOIWMYmgr4ZqD3t5DjKvvetKhXGc/ZG5REYTT6ltKfExEei/Q==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/MaterialDesign-Webfont/5.3.45/css/materialdesignicons.css" integrity="sha256-NAxhqDvtY0l4xn+YVa6WjAcmd94NNfttjNsDmNatFVc=" crossorig
              <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" />
        <link href="CSS/HomeStaff.css" rel="stylesheet" type="text/css"/>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%@include file="header.jsp" %>
        <div class="container">

            <br/>

            <h1>Edit Member</h1>


            <form action="./edit-member" method="post">
                <table>
                    <th:set var="account" value="${account}" />
                    <tbody>
                        <tr>
                            <td>AccountID</td>
                            <td><input type="text" name="accountId" value="${account.accountId}" readonly/></td>
                        </tr>
                        <tr>
                            <td>Username</td>
                            <td><input type="text" name="username" value="${account.username}" required/></td>
                        </tr>
                        <tr>
                            <td>Password</td>
                            <td><input type="password" name="password" value="${account.password}" required /></td>
                        </tr>
                        <tr>
                            <td>Full Name</td>
                            <td><input type="text" name="fullName" value="${account.fullName}" required /></td>
                        </tr>

                        <tr>
                            <td>Type</td>
                            <td>
                                <select name="type" required>
                                    <th:if test="${account.type == 1}">
                                        <option value="1" selected >Staff</option>
                                        <option value="2">Normal User</option>
                                    </th:if>
                                    <th:if test="${account.type == 2}">
                                        <option value="1">Staff</option>
                                        <option value="2" selected>Normal User</option>
                                    </th:if>
                                </select>
                            </td>
                        </tr>
                    <td></td>
                    <td><input type="submit" value="Edit" /></td>
                    </tr>
                    </tbody>
                </table>
                <div/>
            </form>
    </body>
</html>
