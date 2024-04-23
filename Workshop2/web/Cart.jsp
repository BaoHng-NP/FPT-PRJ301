<%-- 
    Document   : Cart
    Created on : Mar 8, 2024, 1:10:44 AM
    Author     : baohu
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/boxicons/2.1.0/css/boxicons.min.css" integrity="sha512-pVCM5+SN2+qwj36KonHToF2p1oIvoU3bsqxphdOIWMYmgr4ZqD3t5DjKvvetKhXGc/ZG5REYTT6ltKfExEei/Q==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/MaterialDesign-Webfont/5.3.45/css/materialdesignicons.css" integrity="sha256-NAxhqDvtY0l4xn+YVa6WjAcmd94NNfttjNsDmNatFVc=" crossorig
              <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" />
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">

    </head>
    <body>
        <nav class="navbar navbar-expand-md navbar-dark bg-dark">
            <div class="container">
                <a class="navbar-brand" href="HomeUser">Mobile Phones</a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExampleDefault" aria-controls="navbarsExampleDefault" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse justify-content-end" id="navbarsExampleDefault">
                    <ul class="navbar-nav m-auto" style="a">

                        <li class="nav-item">
                            <a class="nav-link" href="#">Home</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="Login.jsp">Logout</a>
                        </li>
                    </ul>

                </div>

            </div>
        </div>
    </nav>
<div class="container">
    <h1>Your Cart</h1>
        <c:set var="itemsInCart" value="${requestScope.Cart}" />

        <c:choose>
            <c:when test="${empty itemsInCart or itemsInCart.size() eq 0}">
                <h3>Cart is empty!!!</h3>
            </c:when>
            <c:otherwise>
                <p class="text-danger">${msg2}</p>

 
            <div class="row">
                <div class="col-lg-12">
                    <div class="">
                        <div class="table-responsive">
                            <table class="table project-list-table table-nowrap align-middle table-borderless">
                                <thead>
                                    <tr>
                                        <th scope="col">No.</th>
                                        <th scope="col">Mobile ID</th>
                                        <th scope="col">Name</th>
                                        <th scope="col">Price</th>
                                        <th scope="col">Quantity</th>
                                        <th scope="col">Sub Total</th>
                                        <th scope="col" style="width: 100px;">Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:set var="totalAmount" value="0" />
                                    <c:set var="numberOfMobiles" value="0" />
                                    <c:forEach var="item" items="${itemsInCart}" varStatus="loop">
                                    <form action="UpdateCart" method="post">

                                        <c:set var="totalAmount" value="${totalAmount + item.getSubTotal()}" />
                                        <c:set var="numberOfMobiles" value="${numberOfMobiles + item.getQuantity()}" />

                                        <tr>
                                            <td>${loop.index + 1}</td>
                                            <td>${item.itemId}
                                                <input type="hidden" value="${item.itemId}" name="ItemId"/>
                                            </td>
                                            <td>${item.itemName}</td>
                                            <td>${item.unitPrice}</td>
                                            <td>
                                                <input type="hidden" name="currentQuantity" value="${item.quantity}"/>
                                                <input type="number" min="1" name="quantity" value="${item.quantity}"/>
                                            </td>
                                            <td>${String.format("%.2f", item.getSubTotal())}</td>
                                        <div>
                                            <td style="text-align: center">
                                                <input type="submit" value="Remove" name="action"/>
                                                
                                            </td>
                                            <td style="text-align: center">
                                                <input type="submit" value="Update" name="action">
                                            </td>
                                        </div>
                                        </tr>
                                    </form>  
                                </c:forEach>
                                <tr>
                                    <td colspan="5" style="text-align: right"><b>Total Amount</b></td>
                                    <td>${totalAmount}</td>
                                </tr>

                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>





            <h3>Number of mobiles in cart: ${numberOfMobiles}</h3>
        </c:otherwise>
    </c:choose>
    <form method="post">
        <input type="submit" formaction="HomeUser" value="Continue"/>
        <input type="submit" formaction="SavaCart" value="Save Cart"/>
    </form>

    <c:if test="${not empty requestScope.msg}">
        ${requestScope.msg}
    </c:if>
</div>

</body>
</html>