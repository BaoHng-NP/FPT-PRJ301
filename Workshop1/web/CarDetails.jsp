<%-- 
    Document   : HomePage
    Created on : Jan 24, 2024, 10:37:30 AM
    Author     : baohu
--%>
<%@page import="Models.CarsDAO"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import = "Models.Car"%>
<%@page import = "Models.CarsDAO"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Car</title>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">

        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
    </head>
    <body>
                <jsp:include page="Menu.jsp"></jsp:include>
        <%
            CarsDAO carDao = new CarsDAO();
            Car car = (Car) request.getAttribute("carDetails");
        %>
        <div class="container">
            <h1 class=" text-center mt-5 "> Car Details</h1>
            <h2 class=" text-center mt-5 ">Car</h2>


            <div class="row ">
                <div class="col-lg-7 mx-auto">
                    <div class="card mt-2 mx-auto p-4 bg-light">
                        <div class="card-body bg-light">

                            <div class = "container">
                                <div class="col-md-12">
                                    <table>
                                        <tr>
                                            <th style="text-align: left">CarID</th>
                                            <td><%= car.getCarID()%></td>
                                        </tr>
                                        <tr>
                                            <th style="text-align: left">CarName</th>
                                            <td><%= car.getCarName()%></td>
                                        </tr>
                                        <tr>
                                            <th style="text-align: left">Manufacturer</th>
                                            <td><%= car.getManufacturer()%></td>
                                        </tr>
                                        <tr>
                                            <th style="text-align: left">Price</th>
                                            <td><%= car.getPrice()%></td>
                                        </tr>
                                        <tr>
                                            <th style="text-align: left">Released Year</th>
                                            <td><%= car.getReleasedYear()%></td>
                                        </tr>
                                    </table>
                                </div>

                                <div class="col-md-12">


                                    <a  href=UpdateCar.jsp?CarID=<%=car.getCarID()%>>Edit |</a>
                                    <a  href="HomePage.jsp">Back to list</a>
                                </div>
                            </div>
                        </div>


                    </div>
                    <!-- /.8 -->

                </div>
                <!-- /.row-->

            </div>
        </div>
    </body>
</html>
