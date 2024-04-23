<%--
    Document   : orderpage
    Created on : Feb 26, 2024, 8:38:15 PM
    Author     : ASUS
--%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

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
        <link href="CSS/HomeStaff.css" rel="stylesheet" type="text/css"/>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
    </head>
    <body>
        <%@include file="header-user.jsp" %>

 <div class="container">
     <br>
        <h1>My Order</h1>

    <th:if test="${message != null}">
        <p>${message}</p>
    </th:if>
    <th:if test="${orderDetails != null}">
        <p>${orderDetails.size()} orders found</p>




        <div class="row">
            <div class="col-lg-12">
                <div class="">
                    <div class="table-responsive">
                        <table class="table project-list-table table-nowrap align-middle table-borderless">
                            <thead>
                                <tr>

                                    <c:if test="${orderDetails != null}">
                                        <th scope="col">ID</th>
                                        <th scope="col">Contact Name</th>
                                        <th scope="col">Ship Address</th>
                                        <th scope="col">Phone</th>
                                        <th scope="col">Product</th>
                                        <th scope="col">Category</th>
                                        <th scope="col">Unit Price</th>
                                        <th scope="col">Quantity</th>
                                        <th scope="col">Order Date</th>
                                        <th scope="col" style="width: 200px;">Delete</th>
                                        </c:if>
                                </tr>
                            </thead>
                            <tbody>
                            <p class="col-md-12 text-primary">${msg}</p>



                            <c:forEach items="${orderDetails}" var="orderDetail">
                                <tr>

                                    <td >${orderDetail.order.orderId}</td>
                                    <td >${orderDetail.order.customer.contactName}</td>
                                    <td >${orderDetail.order.customer.address}</td>
                                    <td >${orderDetail.order.customer.phone}</td>
                                    <td >${orderDetail.product.productName}</td>
                                    <td >${orderDetail.product.category.categoryName}</td>
                                    <td >${orderDetail.product.unitPrice}</td>
                                    <td >${orderDetail.quantity}</td>
                                    <td >${orderDetail.order.orderDate}</td>
                                    <td>
                                        <ul class="list-inline mb-0">                                            
                                            <li class="list-inline-item">
                                                <a href="OrderDelete?orderId=${orderDetail.order.orderId}&&productId=${orderDetail.product.productId}" data-bs-toggle="tooltip" data-bs-placement="top" title="Delete" class="px-2 text-danger"><i class="bx bx-trash-alt font-size-18"></i></a>
                                            </li>
                                        </ul>
                                    </td>
                                </tr>
                            </c:forEach>

                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
 </div>









    </th:if>
</body>
</html>
