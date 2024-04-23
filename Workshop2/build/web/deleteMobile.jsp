<%-- 
    Document   : deleteMobile
    Created on : Mar 3, 2024, 3:58:55 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <!------ Include the above in your HEAD tag ---------->
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>







        <div class="container">
            <div class=" text-center mt-5 ">

                <h1>Delete</h1>
                <h2>Are you sure you want to delete this?</h2>
                <h3>Mobile</h3>
                <hr class="separator">


            </div>


            <div class="row ">
                <div class="col-lg-7 mx-auto">
                    <div class="card mt-2 mx-auto p-4 bg-light">
                        <div class="card-body bg-light">

                            <div class = "container">
                                <div class="col-md-12">
                                    <table>
                                        <tr>
                                            <th style="text-align: left">MobileId</th>
                                            <td>${mobile.mobileId}</td>
                                        </tr>

                                        <tr>
                                            <th style="text-align: left">MobileName</th>
                                            <td>${mobile.mobileName}</td>
                                        </tr> 

                                        <tr>
                                            <th style="text-align: left">YearOfProduction</th>
                                            <td>${mobile.yearOfProduction}</td>
                                        </tr>

                                        <tr>
                                            <th style="text-align: left">Description</th>
                                            <td>${mobile.description}</td>
                                        </tr>

                                        <tr>
                                            <th style="text-align: left">Price</th>
                                            <td>${mobile.price}</td>
                                        </tr>

                                        <tr>
                                            <th style="text-align: left">Quantity</th>
                                            <td>${mobile.quantity}</td>
                                        </tr>

                                        <tr>
                                            <th style="text-align: left">NotSale</th>
                                            <td>${mobile.notSale}</td>
                                        </tr>

                                    </table>
                                </div>
                                <p class="col-md-12 text-primary">${msg}</p>

                                <div class="col-md-12">


                                    <form action="Delete?MobileId=${mobile.mobileId}" method="post">
                                        <input type="submit" class="btn btn-success btn-send  pt-2 btn-block
                                               " value="Delete" name ="btnLogin">
                                        <a href="HomeStaff">| Back to home</a>
                                    </form>
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
