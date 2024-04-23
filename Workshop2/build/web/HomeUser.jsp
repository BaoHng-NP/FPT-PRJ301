<%-- 
    Document   : HomeUser
    Created on : Mar 5, 2024, 3:54:58 PM
    Author     : baohu
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home Page</title>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <!------ Include the above in your HEAD tag ---------->
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <jsp:include page="Menu.jsp"></jsp:include>
            <div class="container">
                <div class="row">
                    <div class="col">
                        <nav aria-label="breadcrumb">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="HomeUser">Home</a></li>
                            </ol>
                        </nav>
                    </div>
                </div>
            </div>
            <div class="container">
                <div class="row">
                    <div class="col-sm-12">
                        <div class="row">
                            <p class="col-md-12 text-primary">${msg}</p>
                        <c:forEach items="${listMobile}" var="o">
                            <c:if test="${o.notSale == false}">
                                <div class="col-12 col-md-6 col-lg-3">
                                    <div class="card">
                                        <div class="card-body">
                                            <h4 class="card-title show_txt"><a href="#" title="View Product">${o.mobileName}</a></h4>
                                            <p class="card-text show_txt">ID: ${o.mobileId}</p>
                                            <div class="row">
                                                <div class="col">
                                                    <p class="card-header bg-success text-white text-uppercase">Price: ${o.price} $</p>
                                                </div>
                                                <div class="col">
                                                    <p class="card-header bg-success text-white text-uppercase">Year of production :${o.yearOfProduction}</p>
                                                </div>
                                                <div class="col">
                                                    <p class="card-header bg-success text-white text-uppercase">Discription: ${o.description}</p>
                                                </div>
                                                <div class="col">
                                                    <p class=" text-black text-uppercase">Quantity: ${o.quantity}</p>
                                                </div>
                                                <div class="col">
                                                    
                                                    <c:if test="${o.quantity<=0}"><p class="col-md-12 text-primary">Sold Out!!"</p></c:if>
                                                    <a <c:if test="${o.quantity>0}">href="AddCart?MobileId=${o.mobileId}"</c:if> class="btn btn-secondary btn-block">Add to cart</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:if>
                        </c:forEach>
                    </div>
                </div>

            </div>
        </div>

        <!-- Footer -->
        <footer class="text-light">
            <div class="container">
                <div class="row">

                    <div class="col-12 copyright mt-3">
                        <p class="float-left">
                            <a href="#">Back to top</a>
                        </p>
                    </div>
                </div>
            </div>
        </footer>
    </body>
</html>
