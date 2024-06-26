<%-- 
    Document   : Menu
    Created on : Mar 5, 2024, 11:01:12 PM
    Author     : baohu
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!--begin of menu-->
<nav class="navbar navbar-expand-md navbar-dark bg-dark">
    <div class="container">
        <a class="navbar-brand" href="HomeUser">Mobile Phones</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExampleDefault" aria-controls="navbarsExampleDefault" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse justify-content-end" id="navbarsExampleDefault">
            <ul class="navbar-nav m-auto">

                <li class="nav-item">
                    <a class="nav-link" href="#">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="Login.jsp">Logout</a>
                </li>

            </ul>

            <form action="SearchByPrice" method="post" class="form-inline my-2 my-lg-0">
                <div class="input-group input-group-sm">
                    <input value="${valueMin}" name="min" type="number" class="form-control" aria-label="Small" aria-describedby="inputGroup-sizing-sm" placeholder="Start Price..."required>
                    <input value="${valueMax}" name="max" type="number" class="form-control" aria-label="Small" aria-describedby="inputGroup-sizing-sm" placeholder="End Price..."required>
                    <div class="input-group-append">
                        <button type="submit" class="btn btn-secondary btn-number">
                            <i class="fa fa-search"></i>
                        </button>
                    </div>

            </form>
        </div>
        <a class="btn btn-success btn-sm ml-3" href="ViewCart">
            <i class="fa fa-shopping-cart"></i> Cart
        </a>
    </div>
</div>
</nav>
<section class="jumbotron text-center">
    <div class="container">
        <h1 class="jumbotron-heading">Welcome to Mobile online Store</h1>
    </div>
</section>
<!--end of menu-->