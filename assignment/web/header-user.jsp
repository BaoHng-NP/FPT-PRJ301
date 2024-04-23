<%-- 
    Document   : header
    Created on : Jun 11, 2023, 4:25:09 PM
    Author     : Nguyen Thanh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
          <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <!------ Include the above in your HEAD tag ---------->
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">

        <title>JSP Page</title>
        <link rel="stylesheet" href="./asset/styles.css">

    </head>
    <body>
        <div id="header">

            <nav>
                <ul id="main-menu">
                    <li>
                        <a href="./home"><h2>Pizza Store</h2></a>
                    </li>
                    <li>
                        <a href="./home">Pizzas</a>
                    </li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Categories <span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <c:forEach items="${categories}" var="cat">
                                <li class="${tag == cat.categoryId ? "active":""}"><a href="home?cid=${cat.categoryId}" style="color: black;">${cat.categoryName}</a></li>
                                </c:forEach>
                        </ul>

                    </li>


                    <li>
                        <a <c:if test="${sessionScope.account != null}">href="./my-order?accountId=${sessionScope.account.username}"</c:if>>My Orders</a>
                        </li>

                    </ul>

                    <div class="header_login">
                    <c:if test="${sessionScope.account == null}">

                        <a href="register.jsp">Register</a>
                        /
                        <a href="login.jsp">Login</a>
                    </c:if>
                    <c:if test="${sessionScope.account != null}">
                        Welcome, <a href="account"> ${sessionScope.account.username}</a>
                        /
                        <a href="./logout">Logout</a>

                    </c:if>
                </div>
            </nav>
        </div>

        <script>
            $(document).ready(function () {
                $('#toggle').click(function () {
                    $('nav').slideToggle();
                })
            })
        </script>
    </body>
</html>
