<%-- 
    Document   : HomePage
    Created on : Jan 24, 2024, 10:37:30 AM
    Author     : baohu
--%>
<%@page import="Models.CarsDAO"%>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;300&display=swap">

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import = "Models.Car"%>
<%@page import = "Models.CarsDAO"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Page</title>
                 <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <!------ Include the above in your HEAD tag ---------->
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
    </head>
    <body>
                <jsp:include page="Menu.jsp"></jsp:include>
        <%
            String carId = request.getParameter("CarID");
            CarsDAO carDao = new CarsDAO();
            Car car = carDao.getCarById(carId);
        %>
        <div class="container">
            <h1 class=" text-center mt-5 ">Update Car</h1>


        </div>
                    <div class="row ">
                <div class="col-lg-7 mx-auto">
                    <div class="card mt-2 mx-auto p-4 bg-light">
                        <div class="card-body bg-light">

                            <div class = "container">
                                <form id="contact-form" role="form" action="UpdateServlet" method="post">
                                    <div class="controls">

                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label for="form_name">CarId</label>
                                                    <input class="form-control" name="txtCarId" required value="<%= car.getCarID()%>" readonly />
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label for="form_lastname">CarName</label>
                                                    <input class="form-control" name="txtCarName" required value="<%= car.getCarName()%>" />
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label for="form_year">Manufacturer</label>
                                                    <input class="form-control" type="text" required name="txtManufacturer" value="<%= car.getManufacturer()%>" />

                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label for="form_email">Price</label>
                                                    <input class="form-control" type="text"required pattern="[0-9]+(\.[0-9]+)?"  title="Please enter a number" name="txtPrice" value="<%= car.getPrice()%>" />

                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">

                                            <div class="col-md-8">
                                                <div class="form-group">
                                                    <label for="form_year">ReleasedYear</label>
                                                    <input class="form-control" type="text" required pattern="^(19\d{2}|20[0-1]\d|202[0-4])$" title="Please enter a year between 1900 and 2024" name="txtReleasedYear" value="<%= car.getReleasedYear()%>" />

                                                </div>
                                            </div>


                                            <div class="col-md-12">
                                                <input class="btn btn-success btn-send  pt-2 btn-block" type="submit" value="Save" name ="btnSave" />
                                                <a href="HomePage.jsp">| Back to home</a>

                                            </div>

                                        </div>


                                    </div>
                                </form>
                            </div>
                        </div>


                    </div>
                    <!-- /.8 -->

                </div>
                <!-- /.row-->

            </div>
    </body>
</html>
