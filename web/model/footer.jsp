<%-- 
    Document   : footer
    Created on : Nov 4, 2023, 7:27:28 PM
    Author     : Admin
--%>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<!-- Bootstrap CSS -->
<script src="https://unpkg.com/boxicons@2.1.4/dist/boxicons.js"></script>
<script src="https://kit.fontawesome.com/2eca86e2a2.js" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://getbootstrap.com/docs/5.3/assets/css/docs.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<!-- Custom CSS -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<style>
    .Footer-Container{

        margin-top: 35px;
        border: 1px solid white;
        border-radius: 10px;
        font-family: Cera Pro,sans-serif;
        height: auto;
        background-color: black;
        color: white;
        box-shadow: 5px 5px 10px rgba(0, 0, 0, 0.3);

    }

    .container, .container-fluid, .container-lg, .container-md, .container-sm, .container-xl, .container-xxl {
        padding-right: 0; /* Ghi đè giá trị của padding-right */
        padding-left: 0;  /* Ghi đè giá trị của padding-left */
    }


</style>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<div class="container my-5">
    <footer
        class="text-center text-lg-start text-white"
        style="border: 1px solid white;
        border-radius: 10px; box-shadow: 5px 5px 10px rgba(0, 0, 0, 0.3);  background-color: #1c2331;
        width: 100%; padding-left: 0;"
        >


        <!-- Section: Links  -->
        <section class="">
            <div class="container text-center text-md-start mt-5">
                <div class="row mt-3">
                    <div class="col-md-3 col-lg-4 col-xl-3 mx-auto mb-4">
                        <h6 class="text-uppercase fw-bold">FeedBack</h6>
                        <hr
                            class="mb-4 mt-0 d-inline-block mx-auto"
                            style="width: 60px; background-color: #7c4dff; height: 2px"
                            />
                        <!--                        <input class="form-control" type="text"  name="feedback" placeholder="FeedBack Here..." >     -->


                        <form class="mt-2 text-center" action="feedback">
                            <c:set value="${sessionScope.account }" var="i"/>
                            
                            <input type="hidden" value="${i.user_name}" name="name">
                            <textarea class="form-control mb-2" name="feedback" rows="4" cols="25" placeholder="FeedBack Here..."></textarea>
                            <input class="btn btn-primary profile-button" type="submit" value="Send">

                        </form>

                        <!--                        <div class="mt-2 text-center">
                                                    
                                                    <input class="btn btn-primary profile-button" type="submit" value="Send">
                        
                                                </div>-->


                        <!--                        <p>LEGO System A/S, DK-7190 Billund, Denmark. Must be 18 years or older to purchase online.</p>
                                                <p>Use of this site signifies your agreement to the terms of use.</p>-->
                    </div>

                    <div class="col-md-3 col-lg-2 col-xl-2 mx-auto mb-4">
                        <h6 class="text-uppercase fw-bold">Useful links</h6>
                        <hr class="mb-4 mt-0 d-inline-block mx-auto" style="width: 60px; background-color: #7c4dff; height: 2px" />
                        <p><a href="#!" class="text-white">Your Account</a></p>
                        <p><a href="#!" class="text-white">FeedBack</a></p>
                        <p> <a href="#!" class="text-white">Shipping Rates</a></p>
                        <p><a href="#!" class="text-white">Help</a></p>
                    </div>
                    <!-- Grid column -->
                    <div class="col-md-4 col-lg-3 col-xl-3 mx-auto mb-md-0 mb-4">
                        <h6 class="text-uppercase fw-bold">Contact</h6>
                        <hr
                            class="mb-4 mt-0 d-inline-block mx-auto"
                            style="width: 60px; background-color: #7c4dff; height: 2px"
                            />
                        <p><i class="fas fa-home mr-3"></i> FPT University</p>
                        <p><i class="fas fa-envelope mr-3"></i> BDHoang03@gmail.com</p>
                        <p><i class="fas fa-phone mr-3"></i> +84 763310655</p>
                        <p><i class="fas fa-print mr-3"></i> +84 763310655</p>
                    </div>
                </div>
            </div>
        </section>
    </footer>
</div>




