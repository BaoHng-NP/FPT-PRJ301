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
        <title>PizzaStore</title>
        <script type="text/javascript">
            function doDelete(id) {
                if(confirm("Are you sure to delete member with id = " + id)) {
                    window.location = "./delete-member?accountId=" + id;
                }
            }
        </script>
    </head>
    <body>
        <%@include file="header.jsp" %>
        <div class="container">
        <br/>
        <h2>Orders</h2>

        <th:if test="${message != null}">
            <p>${message}</p>
        </th:if>
        <th:if test="${orderDetails != null}">
            
            <p class="col-md-12 text-primary">${msg}</p>
        <table>
            <tr >
                <th style="padding: 5px 10px;">ID</th>
                <th style="padding: 5px 10px;">Contact Name</th>
                <th style="padding: 5px 10px;">Ship Address</th>
                <th style="padding: 5px 10px;">Phone</th>
                <th style="padding: 5px 10px;">Product</th>
                <th style="padding: 5px 10px;">Category</th>
                <th style="padding: 5px 10px;">Unit Price</th>
                <th style="padding: 5px 10px;">Quantity</th>
                <th style="padding: 5px 10px;">Order Date</th>

            </tr>
            <c:forEach items="${orderDetails}" var="orderDetail">
                <tr style="border-bottom: #777777 1px solid">
                    <td style="padding: 5px 10px;">${orderDetail.order.orderId}</td>
                    <td style="padding: 5px 10px;">${orderDetail.order.customer.contactName}</td>
                    <td style="padding: 5px 10px;">${orderDetail.order.customer.address}</td>
                    <td style="padding: 5px 10px;">${orderDetail.order.customer.phone}</td>
                    <td style="padding: 5px 10px;">${orderDetail.product.productName}</td>
                    <td style="padding: 5px 10px;">${orderDetail.product.category.categoryName}</td>
                    <td style="padding: 5px 10px;">${orderDetail.product.unitPrice}</td>
                    <td style="padding: 5px 10px;">${orderDetail.quantity}</td>
                    <td style="padding: 5px 10px;">${orderDetail.order.orderDate}</td>
                    <td>
                                        <ul class="list-inline mb-0">                                            
                                            <li class="list-inline-item">
                                                <a href="OrderDelete?orderId=${orderDetail.order.orderId}&&productId=${orderDetail.product.productId}" data-bs-toggle="tooltip" data-bs-placement="top" title="Delete" class="px-2 text-danger"><i class="bx bx-trash-alt font-size-18"></i></a>
                                            </li>
                                        </ul>
                                    </td>

                </tr>
            </c:forEach>
        </table>
        </th:if>
        </div>
    </body>
</html>
