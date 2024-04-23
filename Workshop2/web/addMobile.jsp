<%-- 
    Document   : addMobile
    Created on : Mar 1, 2024, 5:55:23 PM
    Author     : Admin
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <!------ Include the above in your HEAD tag ---------->
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <title>Add Mobile</title>
    </head>
    <body>

        <div class="container">
            <div class=" text-center mt-5 ">

                <h1 >Adding new mobile</h1>


            </div>


            <div class="row ">
                <div class="col-lg-7 mx-auto">
                    <div class="card mt-2 mx-auto p-4 bg-light">
                        <div class="card-body bg-light">

                            <div class = "container">
                                <form id="contact-form" role="form" action="Add" method="post">
                                    <div class="controls">

                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label for="form_name">Mobile ID *</label>
                                                    <input id="form_id" type="text" name="mobileId" class="form-control" placeholder="Please enter Mobile ID *" required="required" data-error="Mobile ID is required.">

                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label for="form_lastname">Mobile name *</label>
                                                    <input id="form_name" type="text" name="mobileName" class="form-control" placeholder="Please enter name *" required="required" data-error="Mobile name is required.">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label for="form_year">Year of production *</label>
                                                    <input id="form_year" type="number" name="numYear" class="form-control" placeholder="Please enter year *" required="required" data-error="year is required.">

                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label for="form_email">Price *</label>
                                                    <input id="form_email" type="number" name="numPrice" class="form-control" placeholder="Please enter price *" required="required" data-error="Price is required.">

                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">

                                            <div class="col-md-8">
                                                <div class="form-group">
                                                    <label for="form_year">Description *</label>
                                                    <input id="form_year" type="text" name="description" class="form-control" placeholder="Please enter description *" required="required" data-error="Description is required.">

                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <label for="form_quantity">Quantity *</label>
                                                    <input id="form_quantity" type="number" name="numQuantity" class="form-control" placeholder="Please enter quantity *" required="required" data-error="Quantity is required.">

                                                </div>
                                            </div>
                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <label for="txtRele">NotSale</label>
                                                    <input class="5" type="checkbox" name="chkNotSale"/><br/>
                                                </div>
                                            </div>
                                            <p class="col-md-12 text-primary">${msg}</p>

                                            <div class="col-md-12">

                                                <input type="submit" class="btn btn-success btn-send  pt-2 btn-block
                                                       " value="Add new mobile" >
                                                <a href="HomeStaff">| Back to home</a>

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
        </div>

    </body>
</html>
