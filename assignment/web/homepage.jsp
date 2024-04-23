<%-- 
    Document   : register
    Created on : Feb 25, 2024, 4:10:43 PM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <!------ Include the above in your HEAD tag ---------->
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>PizzaStore</title>
    </head>
    <body>
        <%@include file="header-user.jsp" %>

        <div class="container">
            <br/>
            <h1>Pizza Store</h1>
            <br/>
            <form method="get" action="./home">
                Search <input type="text" name="search" value="${param.search}">
                <input type="submit" value="Search" style="color: white; background: #333; padding: 5px; border-radius: 5px">
            </form>
            <br/>
            <th:if test="${message != null}">
                <p>${message}</p>
            </th:if>
            <th:if test="${pizzas != null}">
   
                <c:if test="${sessionScope.account == null}">
                    <h2 class="text-danger">Login to order!</h2>
                </c:if>
                    
                <br/>
                <div class="row">

                    <div class="col-sm-12">
                        <div class="row">
                            <c:forEach items="${pizzas}" var="pizza">
                                <div class="col-12 col-md-6 col-lg-3">
                                    <div class="card">
                                        <img class="card-img-top" src="${pizza.productImage}" alt="Card image cap">
                                        <div class="card-body">
                                            <h4 class="card-title show_txt"><a href="#" title="View Product">${pizza.productName}</a></h4>
                                            <h5 class="card-text show_txt">${pizza.category.categoryName}</h5>
                                            <p class="card-text show_txt">${pizza.category.description}</p>                                            
                                            <p class="card-text show_txt">Quantity: ${pizza.quantityPerUnit}</p>
                                            <div class="row">
                                                <div class="col">
                                                    <c:if test="${pizza.quantityPerUnit>0}"><p class="btn btn-success btn-block">${pizza.unitPrice} $</p> </c:if>
                                                    <c:if test="${pizza.quantityPerUnit<=0}"><p class="btn btn-danger btn-block">SOLDOUT </p> </c:if>
                                                </div>
                                                <div class="col">
                                                    <form method="get" action="./order">
                                                        <input type="hidden" name="productId" value="${pizza.productId}">
                                                        <input type="hidden" name="productName" value="${pizza.productName}">
                                                        <input type="hidden" name="unitPrice" value="${pizza.unitPrice}">
                                                        <input type="hidden" name="quantity" value="1">
                                                        <input class="btn btn-success btn-block" type="submit" value="Order" style="color: white; background: #333; padding: 5px; border-radius: 5px"
                                                               <c:if test="${sessionScope.account == null}">disabled</c:if>
                                                               <c:if test="${pizza.quantityPerUnit<=0}">disabled</c:if>
                                                               >
                                                    </form>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </div>

                </div>
        </div>



    </th:if>
    <br/>


</body>
</html>
