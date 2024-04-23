<%-- 
    Document   : HomePage
    Created on : Jan 24, 2024, 10:37:30 AM
    Author     : baohu
--%>

<%@page import="Models.Car" %>
<%@page import="Models.CarsDAO" %>
<%@page import="java.util.List" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="CSS/HomePage.css" rel="stylesheet" type="text/css"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home Page</title>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <!------ Include the above in your HEAD tag ---------->
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">

    </head>
    <body style="margin:0px">

        <jsp:include page="Menu.jsp"></jsp:include>
            <div class="container">
                <div class="title">
                    <h1>Car List</h1>
                    <div>
                            <a href='AddCar.jsp' data-bs-toggle="modal" data-bs-target=".add-new" class="btn btn-primary"><i class="bx bx-plus me-1"></i> Add New</a>
                        </div>
                </div>

                <div class="table1"> 
                <% CarsDAO carsDAO = new CarsDAO();
                    List<Car> carList = carsDAO.getCars();
                    if (carList != null) {
                %>
                <div class="row">
                    <div class="col-lg-12">
                        <div class="">
                            <div class="table-responsive">
                                <table class="table project-list-table table-nowrap align-middle table-borderless">
                                    <thead >
                                        <tr style="border-bottom: 2px solid #ddd; border-top: 2px solid #ddd">
                                            <th class="carID" >CarId</th>
                                            <th class="carName">CarName</th>
                                            <th class="Manufacturer">Manufacturer</th>
                                            <th class="Price">Price</th>
                                            <th class="relesedYear">ReleasedYear</th>
                                            <th style="text-align: left" colspan="3"></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <%
                                            for (Car car : carList) {
                                        %>
                                        <tr style="border-top: 1px solid #ddd">
                                            <td><%=car.getCarID()%></td>
                                            <td><%=car.getCarName()%></td>
                                            <td><%=car.getManufacturer()%></td>
                                            <td><%=car.getPrice()%></td>
                                            <td><%=car.getReleasedYear()%></td>
                                            <td class="link"><a class="action-link" href="UpdateCar.jsp?CarID=<%=car.getCarID()%>">Edit</a> |  
                                                <a class="action-link" href="CarDetailsServlet?CarID=<%=car.getCarID()%>">Details</a> |
                                                <a class="action-link" href="DeleteCar.jsp?CarID=<%=car.getCarID()%>">Delete</a>
                                            </td>
                                        </tr>
                                        <%                    }
                                        %>
                                    </tbody>

                                </table>
                            </div>
                        </div>
                    </div>
                </div>
                <%
                } else {
                %>
                <h3>No the cars found</h3>
                <%
                    }
                %>
            </div>
        </div>



    </body>
</html>
