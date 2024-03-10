<%-- 
    Document   : Home
    Created on : Sep 30, 2023, 5:40:38 PM
    Author     : Hoang's LEGION
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
        <title>JSP Trang Chu</title>

        <!-- Bootstrap CSS -->
        <script src="https://unpkg.com/boxicons@2.1.4/dist/boxicons.js"></script>
        <script src="https://kit.fontawesome.com/2eca86e2a2.js" crossorigin="anonymous"></script>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://getbootstrap.com/docs/5.3/assets/css/docs.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Custom CSS -->
        <link rel="stylesheet" href="CSS/Home.css">
        <style>



            /*            .optioncontent {
                            border: 1px solid #ccc;
                            border-radius: 10px;
                            border: none;
                            width: 100%;
                            font-family: Cera Pro,sans-serif;
                        }
            
            
                        .optioncontent:hover {
                            background-color: black;  Đặt màu nền khi trỏ vào 
                            color: yellow;  Đặt màu chữ khi trỏ vào 
                        }
            
            
                        .optioncontent a {
                            display: flex;
                            justify-content: left;
                            align-items: center;
                            padding-left: 20px;
                            height:  40px;
                            color: black;
                            text-decoration: none;
                            font-size: 16px;
                            text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.3);
            
                        }
            
            
            
            
            
                        .options-box {
                            display: none;
                            position: absolute;
                            background-color: #F6F6F5;
                            border: 1px solid #ccc;
                            border-radius: 10px;
                            width: 170px;
                            z-index: 1;
                            top: 100%;
                            right:  0;
                            margin-top: 10px;  Khoảng cách từ .avatarOptions 
                            text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.3);
                        }
            
            
            
                         CSS cho avatar 
                        .avatar {
                            cursor: pointer;
                        }
            
                         Khi bạn rê chuột vào avatar, hiển thị ô vuông tùy chọn 
                        .avatar:hover + .options-box {
                            display: block;
                        }
            
                        .avatarOptions {
                            display: flex;
                            align-items: center;
                            position: relative;
                        }
            
            
                        .avatarOptions img{
                            height: 60px;
                            width: 60px;
                            border-radius: 50%;
                            border: green solid 3px;
                        }
            
                        .headerLast {
                            display: flex;
                            justify-content: space-between;
                            align-items: center;
                        }
            
                        .avatarOptions{
                            padding-left: 8px;
                        }
            
                        .headerLastContent h3{
                            opacity: 0.6;
                            font-weight: 520;
                            font-size: 25px;
                            text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.3);  Điều chỉnh giá trị bóng và độ mờ tại đây 
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
            
            
            
                        input.form-control:focus{
                            box-shadow: none;
                            border: 1.5px solid #E3E6ED;
                            background-color: #F7F8FD;
                            letter-spacing: 1px;
                        }
                        .btn-primary{
                            background-color: #5878FF!important;
                            border-radius: 7px;
                        }
                        .btn-primary:focus{
                            box-shadow: none;
                        }
            */










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



            <!-- DropDown List -->         
            <div class="col-md-12 d-flex  align-items-center mt-5 mb-5" style="justify-content: space-between;">
                <div class="dropdown col-md-2">
                    <button class="btn btn-secondary dropdown-toggle show" type="button" data-bs-toggle="dropdown" aria-expanded="true">
                        Category
                    </button>
                    <ul class="dropdown-menu show" style="position: absolute; inset: 0px auto auto 0px; margin: 0px; transform: translate3d(0px, 40px, 0px);" data-popper-placement="bottom-start">
                        <c:forEach items="${sessionScope.cate}" var="i">
                            <li><a class="dropdown-item" href="search?name=${i.cateegory_name}">${i.cateegory_name}</a></li>
                            </c:forEach>
                    </ul>
                </div>
            </div>
            <!-- DropDown List -->




            <!-- Navigation Menu -->
            <!--            <div class="row">
                            <div class="nav-menu " id="navMenu">
                                <ul class="d-flex justify-content-center align-items-center" style="text-decoration: none; list-style: none; gap: 70px; margin-top: 40px;">
                                    <li><a href="#" class="link" style="text-decoration: none;">SHOP</a></li>
                                    <li><a href="#" class="link" style="text-decoration: none;">DISCOVER</a></li>
                                    <li><a href="#" class="link" style="text-decoration: none;">HELP</a></li>
                                    <li><a href="#" class="link" style="text-decoration: none;">SALE</a></li>
                                </ul>
                            </div>            
                        </div>-->
            <!-- Navigation Menu -->


            <!-- Body Container -->
            <div class="Body-Container">
                <div class="row" style="width: 100%; margin-bottom: 0;">
                    <h1 style="margin-bottom: 0; text-align: center; padding-top: 20px;">TOP 3 NEWEST PRODUCTS</h1>
                </div>

                <div class="bodyContent">                 
                    <c:forEach items="${sessionScope.Top3ProductList}" var="p">
                        <div class="content col-md-11" style="height: auto; display: flex; flex-direction: column; justify-content: space-between;">
                            <div class="noidung d-flex flex-column " style="width: 100%;">
                                <div class="col-md-12">
                                    <a href="productDetail?productid=${p.product_id}">
                                        <img src="Image/${p.product_image}" alt="alt" style="max-width:  80%;"/>
                                    </a>
                                </div>
                                <div class="col-md-10 mb-0 mt-0 " style="font-size: 30px; font-weight: bolder; max-width: 90%; margin: 0 auto;">
                                    ${p.product_name}
                                </div>
                                <div class="col-md-10 mb-0 mt-0" style="font-size: 18px; font-weight: 500; width: 100%; margin: 0 auto;">
                                    $${p.product_price}
                                </div>   
                            </div>
                            <div class="bodyButton " style="width: 100%;">
                                <form action="buy" method="post" style="width: 100%;">
                                    <input type="hidden" name="num" value="1">
                                    <input type="hidden" name="id" value="${p.product_id}">
                                    <input class="shopping mb-3" style="max-width: 70%; bottom: 0;" type="submit" value="Add To Bag">
                                </form>
                            </div>
                        </div>
                    </c:forEach>                  
                </div>



                <div class="row" style="width: 100%; margin-bottom: 0;">
                    <h1 style="margin-bottom: 0; text-align: center;">PRODUCTS </h1>
                </div>

                <div class="bodyContent">
                    <c:forEach items="${sessionScope.ProductList}" var="p" varStatus="loop">
                        <c:if test="${loop.index < 9}">
                            <div class="content col-md-11" style="height: auto; display: flex; flex-direction: column; justify-content: space-between;">
                                <div class="noidung d-flex flex-column " style="width: 100%;">
                                    <div class="col-md-12">
                                        <a href="productDetail?productid=${p.product_id}">
                                            <img src="Image/${p.product_image}" alt="alt" style="max-width:  80%;"/>
                                        </a>
                                    </div>
                                    <div class="col-md-10 mb-0 mt-0 " style="font-size: 30px; font-weight: bolder; max-width: 90%; margin: 0 auto;">
                                        ${p.product_name}
                                    </div>
                                    <div class="col-md-10 mb-0 mt-0" style="font-size: 18px; font-weight: 500; width: 100%; margin: 0 auto;">
                                        $${p.product_price}
                                    </div>   
                                </div>
                                <div class="bodyButton " style="width: 100%;">
                                    <form action="buy" method="post" style="width: 100%;">
                                        <input type="hidden" name="num" value="1">
                                        <input type="hidden" name="id" value="${p.product_id}">
                                        <input class="shopping mb-3" style="max-width: 70%; bottom: 0;" type="submit" value="Add To Bag">
                                    </form>
                                        
                                </div>
                            </div>
                        </c:if>
                    </c:forEach>
                </div>
            </div>
            <!-- Body Container -->

            <!--Footer-->
            <%@include file="model/footer.jsp" %>
            <!--Footer-->



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


        <script>
            document.getElementById("logoutBtn").onclick = function () {
                window.location.href = "http://localhost:9999/LegoShop/";
                return false;
            }
        </script>

    </body>
</html>
