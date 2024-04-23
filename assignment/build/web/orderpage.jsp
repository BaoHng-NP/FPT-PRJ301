<%@ page import="dtos.AccountDTO" %>
<%@ page import="daos.AccountDAO" %>
<%@ page import="dtos.CustomerDTO" %>
<%@ page import="daos.CustomerDAO" %><%--
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
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <!------ Include the above in your HEAD tag ---------->
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">

    </head>
    <body>
        <%@include file="header-user.jsp" %>

        <section class="vh-100 gradient-custom">
            <div class="container py-5 h-100">
                <div class="row d-flex justify-content-center align-items-center h-100">
                    <div class="col-12 col-md-8 col-lg-6 col-xl-5">
                        <div class="card bg-dark text-white" style="border-radius: 1rem;">
                            <div class="card-body p-5 text-center">
                                <h1>Confirm Order</h1>
                                <table>
                                    <form action="./order" method="post">
                                        <tbody>
                                            <tr>
                                                <td style="text-align: left">Product Name:</td>
                                                <td style="padding: 5px 10px;">${product.productName}</td>
                                            </tr>
                                            <tr>
                                                <td style="text-align: left">Unit Price:</td>
                                                <td style="padding: 5px 10px;">$${product.unitPrice}</td>
                                            </tr>
                                            <tr>
                                                <td style="text-align: left" >Category:</td>
                                                <td style="padding: 5px 10px;">${product.category.categoryName}</td>
                                            </tr>
                                            <tr>
                                                <td style="text-align: left" >Supplier:</td>
                                                <td style="padding: 5px 10px;">${product.supplier.companyName}</td>
                                            </tr>
                                            <tr>
                                                <td style="text-align: left">Quantity:</td>
                                                <td style="padding: 5px 10px;"><input type="number" value="1" name="quantity"></td>
                                            </tr>
                                        <input type="hidden" value="1" name="quantity">
                                        <input type="hidden" value="${product.productId}" name="productId">
                                        <% AccountDTO account = (AccountDTO) session.getAttribute("account");%>
                                        <%
                                            if (account.getCustomerId() > 0) {
                                                CustomerDAO customerDAO = new CustomerDAO();
                                                CustomerDTO customerDTO = customerDAO.getCustomerById(account.getCustomerId());
                                        %>

                                        <tr>
                                            <td style="text-align: left">Contact Name:</td>
                                            <td style="padding: 5px 10px;"><input type="text" name="contactName" value="<%=customerDTO.getContactName()%>" readonly></td>
                                        </tr>
                                        <tr>
                                            <td style="text-align: left">Address:</td>
                                            <td style="padding: 5px 10px;"><input type="text" name="address" value="<%=customerDTO.getAddress()%>" readonly></td>
                                        </tr>
                                        <tr>
                                            <td style="text-align: left">Phone:</td>

                                            <td style="padding: 5px 10px;"><input type="text" name="phone" value="<%=customerDTO.getPhone()%>" readonly></td>


                                            <%
                                            } else {
                                            %>

                                        <tr>
                                            <td class="form-label" style="text-align: left">Contact Name:</td>
                                            <td class="form-control form-control-lg"style="padding: 5px 10px;"><input type="text" name="contactName" value="${param.contactName}" required></td>
                                        </tr>
                                        <tr>
                                            <td class="form-label" style="text-align: left">Address:</td>
                                            <td class="form-control form-control-lg" style="padding: 5px 10px;"><input type="text" name="address" value="${param.address}" required></td>
                                        </tr>
                                        <tr>
                                            <td class="form-label" style="text-align: left">Phone:</td>

                                            <td class="form-control form-control-lg" style="padding: 5px 10px;"><input type="text" name="phone" value="${param.phone}" required /></td>
                                                <%
                                                    }
                                                %>
                                        </tr>
                                        <tr>
                                            <td></td>
                                            <c:if test="${fail !=1}" >
                                            <td ><input class="btn btn-outline-light btn-lg px-5" type="submit" value="Order" /></td>
                                            </c:if>
                                            <c:if test="${fail ==1}" >
                                                  <p class="text-danger">${msg}</p>
                                                  <a href="home">Back to home page</a>
                                                  </c:if>
                                            </tr>

                                            </tbody>
                                        </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </table>
    </body>
</html>
