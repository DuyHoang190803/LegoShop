<%-- 
    Document   : productdetail
    Created on : Oct 18, 2023, 12:38:45 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@page import="java.util.List"%>
<%@page import="model.User"%>
<%@page import="model.product"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>


        <!-- Bootstrap CSS -->
        <script src="https://unpkg.com/boxicons@2.1.4/dist/boxicons.js"></script>
        <script src="https://kit.fontawesome.com/2eca86e2a2.js" crossorigin="anonymous"></script>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://getbootstrap.com/docs/5.3/assets/css/docs.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Custom CSS -->
        <link rel="stylesheet" href="CSS/ProductDetail.css">


        <style>


            body{

                overflow-x: hidden;
                font-family: Cera Pro,sans-serif;
            }

            .container{
                height: 100%;
                width: 90%;
                margin: 0 auto;

            }


            .left {
                flex:60%;
                padding: 10px; /* Tùy chỉnh padding cho thẻ "left" nếu cần */
                /*                background-color: #ef941e;*/
                display: flex;
                flex-direction: column;
                justify-content: center;
                align-items: center;
                box-shadow: 5px 5px 10px rgba(0, 0, 0, 0.1), -5px -5px 10px rgba(0, 0, 0, 0.1), 5px -5px 10px rgba(0, 0, 0, 0.1), -5px 5px 10px rgba(0, 0, 0, 0.1);

                margin-right: 2%;
                border: 1px solid white;
                border-radius: 10px;
            }


            .right {
                flex: 20%;
                padding: 10px;
                box-shadow: 5px 5px 10px rgba(0, 0, 0, 0.1), -5px -5px 10px rgba(0, 0, 0, 0.1), 5px -5px 10px rgba(0, 0, 0, 0.1), -5px 5px 10px rgba(0, 0, 0, 0.1);
                border: 1px solid white;
                border-radius: 10px;
                position: relative;
            }



            .bodycontainer {
                margin:  40px 0;
                background-color: #F5F5F5;
                height: auto;
                display: flex;
                justify-content: space-between;
                border: 1px solid white;
                border-radius: 10px;
                /* Bóng đổ cho cả bốn góc */

            }

            .bodycontainerImg {
                margin-top: 20px;
                width: 90%;
                height: 450px; /* Đảm bảo phần tử con chiếm toàn bộ chiều cao của viewport */
                display: flex; /* Sử dụng flexbox để căn giữa ngang và dọc */
                justify-content: center; /* Căn giữa theo chiều ngang */
                align-items: center; /* Căn giữa theo chiều dọc */
                border-bottom: 1px solid rgba(0, 0, 0, 0.2);


            }

            .bodycontainerImg img {
                max-width: 100%;
                /*                height: 450px;*/
                max-height: 95%;
                /*                height: 450px;*/
                object-fit: cover;
            }




            .bodycontainerDis{
                margin-top: 5%;
                width: 90%;
            }

            .bodycontainerDis h2{
                margin-bottom: 0;
            }

            .bodycontainerDis p{
                margin-top:  13px;
            }


            .rightHeader{
                width: 100%;
            }


            .rightHeader h1{
                margin-top: 30px;
                font-size: 35px;
                margin-bottom: 7px;
                font-weight: 400;
            }

            .rightHeader h2{
                margin-top: 30px;
                font-size: 28px;
                margin-bottom: 0;
            }

            .rightHeader p{
                color: #3A8B3D;
                margin-top: 10px;
                margin-bottom: 0;
                margin-top:  0;
            }


            .rightBody{
                /*                padding-top: 50px;*/
                width: 100%;
            }

            .rightBodyinfoContent{
                display: flex;
                flex-direction: column;
            }


            .rightBodyButton {
                display: flex;
                justify-content: center; /* Căn giữa theo chiều ngang */
                align-items: center; /* Căn giữa theo chiều dọc */

            }

            .AddToBagButton {
                margin-top: 20px;
                width: 60%;
                font-size: 20px;

                border: none;
                border-radius: 10px;
                background-color: #e68d3a;

            }



            .rightFooter{
                width: 90%;
                position: absolute;
                bottom: 0;
                display: flex; /* Sử dụng flexbox để căn giữa ngang và dọc */
                flex-direction: column;
                margin-bottom: 30px;
                /*                justify-content: center;  Căn giữa theo chiều ngang 
                                align-items: center;  Căn giữa theo chiều dọc */
            }

            .rightFooterContent {
                display: flex;
                justify-content:  space-evenly; /* Căn giữa theo chiều ngang */
                align-items: center; /* Căn giữa theo chiều dọc */

                border-bottom: 1px solid gray;

            }


            .searchbox{
                display: flex;
                width: 500px;
            }

            .searchbox-text{
                width: 500px;
                height: 52px;
                border-radius: 7px;
                font-size: 25px;
            }

            .searchbox-btn{
                width: 55px;
            }

            .btn{
                width: 100%;
                height: 100%;
                font-size: 30px;
            }


            .fa-search{
                color: white;
            }


            .shopping{
                background-color: #ef941e;
                /*    font-weight: 400;
                    cursor: pointer;      Biến con trỏ thành hình bàn tay khi di chuột vào */
                font-size: 25px;
                font-weight: bolder;
                border: 1px black solid;
                border-radius: 5px;
                width: 250px;
                height: 50px;
                box-shadow: 5px 5px 10px rgba(0, 0, 0, 0.3);
            }

            .shopping:hover{
                border: 3px #ef941e solid;
                background-color: wheat;
            }







        </style>

    </head>
    <body>  




        <div class="container">

            <!-- Header -->
            <div class="Header-Container">
                <div class="row align-items-center" style="width: 100%">
                    <div class="col-md-4 headerFirst">
                        <a href="home">
                            <img src="Image/legohub.jpg" alt="alt" style="width: 80%" />
                        </a>
                    </div>
                    <div class="col-md-6 headerMid">
                        <form action="search" class="searchbox" method="post" style="width: 100%">
                            <input type="text" class="form-control searchbox-text" name="name" placeholder="Search...">

                            <div class="input-group-append searchbox-btn">
                                <button class="btn" style="background-color: #5878FF; font-size: 20px;">
                                    <i class="fas fa-search"></i>
                                </button>
                            </div>
                        </form>
                    </div>

                    <div class="col-md-2 headerLast d-flex justify-content-center align-items-center">
                        <c:choose>
                            <c:when test="${sessionScope.account == null}">
                                <div class="headerLastContent" style="width: 100%">
                                    <form action="login" method="">
                                        <input class="input1" type="submit" value="Login" />
                                    </form>
                                </div>
                            </c:when>
                            <c:otherwise>
                                <div class="headerLastContent" style="width: 100%; ">
                                    <h3 style="text-align: end;">${sessionScope.account.user_name}</h3>
                                </div>

                                <div class="avatarOptions">
                                    <img src="Image/${sessionScope.account.user_image}" alt="Avatar" class="avatar" id="avatar">

                                    <div class="options-box" id="options-box">
                                        <form action="profile" method="get">
                                            <button class="optioncontent">
                                                <a id="logout-link">Profile</a>
                                            </button>
                                        </form>

                                        <form action="show" method="get">
                                            <button class="optioncontent">
                                                <a id="logout-link">Cart (${size}) items</a>
                                            </button>
                                        </form>

                                        <form action="changePass" method="get">
                                            <input type="hidden" name="user_password" value="${sessionScope.account.user_password}" />
                                            <button class="optioncontent">
                                                <a id="logout-link">Change Password</a>
                                            </button>
                                        </form>

                                        <form action="logoutServlet" method="get">
                                            <button class="optioncontent">
                                                <a id="logout-link">Logout</a>
                                            </button>
                                        </form>
                                    </div>
                                </div>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>
            </div>
            <!-- Header -->




            <c:set value="${sessionScope.productdetail}" var="p"/>
            <c:set value="${sessionScope.account}" var="i"/>

            <div class="bodycontainer">

                <div class="left">
                    <div class="bodycontainerImg">
                        <img src="Image/${p.product_image}" alt="alt"/>
                    </div>

                    <div class="bodycontainerDis">
                        <h1 style="margin-top: 0;">Description</h1>
                        <p style="font-family: cursive; font-weight: 900;">${p.product_description} </p>
                    </div>

                </div>

                <div class="right">
                    <div class="rightHeader">
                        <h1 style="font-weight: bolder">${p.product_name}</h1>
                        <i class="fa-solid fa-star" style="color: #FBD300;"></i>
                        <i class="fa-solid fa-star" style="color: #FBD300;"></i>
                        <i class="fa-solid fa-star" style="color: #FBD300;"></i>
                        <i class="fa-solid fa-star" style="color: #FBD300;"></i>
                        <i class="fa-solid fa-star" style="color: #FBD300;"></i>
                        <h2>$ ${p.product_price}</h2>
                        <P>Available now</P>
                    </div>

                    <div class="rightBody">
                        <div class="rightBodyTitle">
                            <h2 style="">Buying Information</h2>
                        </div>

                        <div class="rightBodyinfo">
                            <div class="rightBodyinfoContent">
                                Name: <input type="text" name="name" value="${i.user_name}" style="border-radius: 5px;"/>
                            </div>
                            <div class="rightBodyinfoContent">
                                Phone: <input type="text" name="phone" value="${i.user_phone}" style="border-radius: 5px;"/>
                            </div>
                            <div class="rightBodyinfoContent">
                                Email: <input type="text" name="email" value="${i.user_email}" style="border-radius: 5px;"/>
                            </div>
                        </div>


                        <div class="rightBodyButton" style="">
                            <form action="buy" method="post" style="width: 100%;" class="justify-content-center align-items-center d-flex mt-3">
                                <input type="hidden" name="num" value="1">
                                <input type="hidden" name="id" value="${p.product_id}">
                                <input class="shopping mb-3" style="max-width: 70%; bottom: 0; " type="submit" value="Add To Bag">
                            </form>
                        </div>


                    </div>

                    <div class="rightFooter">
                        <div class="rightFooterContent">
                            <i class="fa-solid fa-location-dot" style="color: #2270BA" ></i>
                            <p>Check Store Stock</p>
                        </div>

                        <div class="rightFooterContent">
                            <i class="fa-solid fa-truck" style="color: #2270BA" ></i>
                            <p>Deliveries and Returns</p>
                        </div>

                        <div class="rightFooterContent">
                            <i class="fa-solid fa-building" style="color: #2270BA"></i>
                            <p>Building Instructions</p>
                        </div>
                    </div>



                </div>

            </div>

            <!--Footer-->
            <%@include file="model/footer.jsp" %>




        </div>


        <script>
            document.getElementById("avatar").addEventListener("click", function () {
                var optionsBox = document.getElementById("options-box");
                if (optionsBox.style.display === "block") {
                    optionsBox.style.display = "none";
                } else {
                    optionsBox.style.display = "block";
                }
            });
        </script>


    </body>
</html>
