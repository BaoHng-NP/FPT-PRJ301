<%-- 
    Document   : SignUp
    Created on : Mar 6, 2024, 2:01:34 AM
    Author     : baohu
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
        <link href="CSS/Login.css" rel="stylesheet" type="text/css"/>
        <title>Sign Up</title>
    </head>
    <body>
        <section class="vh-100 gradient-custom">
            <div class="container py-5 h-100">
                <div class="row d-flex justify-content-center align-items-center h-100">
                    <div class="col-12 col-md-8 col-lg-6 col-xl-5">
                        <div class="card bg-dark text-white" style="border-radius: 1rem;">
                            <div class="card-body p-5 text-center">

                                <div class="mb-md-0 mt-md-4 pb-5" >

                                    <h2 class="fw-bold mb-2 text-uppercase">Sign Up</h2>
                                    <p class="text-white-50 mb-5">Welcome to MobileWebShop</p>

                                    <form action="SignUp" method="post">

                                        

                                        <div class="form-outline form-white mb-4">
                                            <input type="text" id="typeEmailX" name="userId" required class="form-control form-control-lg" />
                                            <label class="form-label" for="userId">UserID</label>
                                        </div>
                                        <p class="text-danger">${message1}</p>
                                      

                                        <div class="form-outline form-white mb-4">
                                            <input type="password" id="typePasswordX" name="password" required class="form-control form-control-lg" />
                                            <label class="form-label" for="typePasswordX">Password</label>
                                        </div>
                                        <p class="text-danger">${message2}</p>
                                        <div class="form-outline form-white mb-4">
                                            <input type="text" id="typeEmailX" name="fullName" required class="form-control form-control-lg" />
                                            <label class="form-label" for="fullName">Full Name</label>
                                        </div>
                                        <div class="form-outline form-white mb-4">
                                            <input type="number" id="typeEmailX" name="role" required class="form-control form-control-lg" />
                                            <label class="form-label" for="role">Role (0:user/1:staff)</label>
                                        </div>
                                        <p class="text-danger">${message3}</p>

                                        <button class="btn btn-outline-light btn-lg px-5" type="submit">Submit</button>
                                    </form>

                                </div>

                                <div>
                                    <p class="text-white">${message4}</p>
                                    <p class="mb-0"><a href="Login.jsp" class="text-white-50 fw-bold">Back to Log In</a>
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
