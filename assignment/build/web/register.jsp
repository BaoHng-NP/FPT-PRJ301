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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registration Page</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
        <link href="CSS/Login.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <%@include file="header-auth.jsp" %>

        <section class="vh-100 gradient-custom">
            <div class="container py-5 h-100">
                <div class="row d-flex justify-content-center align-items-center h-100">
                    <div class="col-12 col-md-8 col-lg-6 col-xl-5">
                        <div class="card bg-dark text-white" style="border-radius: 1rem;">
                            <div class="card-body p-5 text-center">

                                <div class="mb-md-0 mt-md-4 pb-5" >

                                    <h2 class="fw-bold mb-2 text-uppercase">Sign Up</h2>
                                    <p class="text-white-50 mb-5">Welcome to Pizza Store</p>

                                    <form action="./register" method="post">

                                        <div class="form-outline form-white mb-4">
                                            <input class="form-control form-control-lg" type="text" name="accountId" required/>
                                            <label class="form-label" for="userId">Account ID</label>
                                        </div>                                      

                                        <div class="form-outline form-white mb-4">
                                            <input class="form-control form-control-lg" type="password" name="password" required/>
                                            <label class="form-label" for="typePasswordX">Password</label>
                                        </div>
                                        <div class="form-outline form-white mb-4">
                                            <input class="form-control form-control-lg" type="password" name="confirmPassword" required/>
                                            <label class="form-label" for="typePasswordX">Confirm Password</label>
                                        </div>
                                        <div class="form-outline form-white mb-4">
                                            <input class="form-control form-control-lg" type="text" name="username" required/>
                                            <label class="form-label" for="fullName">Username</label>
                                        </div>
                                        <div class="form-outline form-white mb-4">
                                            <input class="form-control form-control-lg" type="text" name="fullName" required/>
                                            <label class="form-label" for="fullName">Full Name</label>
                                        </div>

                                        <input class="btn btn-outline-light btn-lg px-5" type="submit" value="Sign up" /></td>
                                    </form>

                                </div>

                                <div>
                                    <p class="text-white">${message4}</p>
                                    <p class="mb-0"><a href="home" class="text-white-50 fw-bold">Back to Log In</a>
                                    </p>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </body>
</html>
