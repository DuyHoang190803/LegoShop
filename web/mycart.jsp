<%-- 
    Document   : mycart
    Created on : Nov 3, 2023, 2:00:51 PM
    Author     : Admin
--%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <script src="https://unpkg.com/boxicons@2.1.4/dist/boxicons.js"></script>
        <script src="https://kit.fontawesome.com/2eca86e2a2.js" crossorigin="anonymous"></script>
        <title>JSP Page</title>
        <style>

            body{
                background: #ddd;
                min-height: 100vh;
                vertical-align: middle;
                display: flex;
                font-family: sans-serif;
                font-size: 0.8rem;
                font-weight: bold;
                font-family: Cera Pro,sans-serif;
            }
            .title{
                margin-bottom: 5vh;
            }
            .card{
                margin: auto;
                max-width: 1100px;
                width: 90%;
                box-shadow: 0 6px 20px 0 rgba(0, 0, 0, 0.19);
                border-radius: 1rem;
                border: transparent;
            }
            @media(max-width:767px){
                .card{
                    margin: 3vh auto;
                }
            }
            .cart{
                background-color: #fff;
                padding: 4vh 5vh;
                border-bottom-left-radius: 1rem;
                border-top-left-radius: 1rem;
            }
            @media(max-width:767px){
                .cart{
                    padding: 4vh;
                    border-bottom-left-radius: unset;
                    border-top-right-radius: 1rem;
                }
            }
            .summary{
                background-color: #ddd;
                border-top-right-radius: 1rem;
                border-bottom-right-radius: 1rem;
                padding: 4vh;
                color: rgb(65, 65, 65);
            }
            @media(max-width:767px){
                .summary{
                    border-top-right-radius: unset;
                    border-bottom-left-radius: 1rem;
                }
            }
            .summary .col-2{
                padding: 0;
            }
            .summary .col-10
            {
                padding: 0;
            }
            .row{
                margin: 0;
            }
            .title b{
                font-size: 1.5rem;
            }
            .main{
                margin: 0;
                padding: 2vh 0;
                width: 100%;
            }
            .col-2, .col{
                padding: 0 1vh;
            }
            a{
                padding: 0 1vh;
            }
            .close{
                margin-left: auto;
                font-size: 0.7rem;
            }
            img{
                width: 3.5rem;
            }
            .back-to-shop{
                margin-top: 4.5rem;
            }
            h5{
                margin-top: 4vh;
            }
            hr{
                margin-top: 1.25rem;
            }
            form{
                padding: 2vh 0;
            }
            select{
                border: 1px solid rgba(0, 0, 0, 0.137);
                padding: 1.5vh 1vh;
                margin-bottom: 4vh;
                outline: none;
                width: 100%;
                background-color: rgb(247, 247, 247);
            }
            input{
                border: 1px solid rgba(0, 0, 0, 0.137);
                padding: 1vh;
                margin-bottom: 4vh;
                outline: none;
                width: 100%;
                background-color: rgb(247, 247, 247);
            }
            input:focus::-webkit-input-placeholder
            {
                color:transparent;
            }
            .btn{
                background-color: #000;
                border-color: #000;
                color: white;
                width: 100%;
                font-size: 0.7rem;
                margin-top: 4vh;
                padding: 1vh;
                border-radius: 0;
            }
            .btn:focus{
                box-shadow: none;
                outline: none;
                box-shadow: none;
                color: white;
                -webkit-box-shadow: none;
                -webkit-user-select: none;
                transition: none;
            }
            .btn:hover{
                color: white;
            }
            a{
                color: black;
            }
            a:hover{
                color: black;
                text-decoration: none;
            }
            #code{
                background-image: linear-gradient(to left, rgba(255, 255, 255, 0.253) , rgba(255, 255, 255, 0.185)), url("https://img.icons8.com/small/16/000000/long-arrow-right.png");
                background-repeat: no-repeat;
                background-position-x: 95%;
                background-position-y: center;
            }
        </style>
    </head>
    <body>

        
        

        <c:set var="o" value="${requestScope.cart}"/>
        <c:set var="tt" value="0"/>


        <div class="card">
            
            <div class="row">
                
                <div class="col-md-8 cart">

                    <div class="title">
                        <div class="row">
                            <div class="col"><h4><b style="font-size: 45px;">Shopping Cart</b></h4></div>
                        </div>
                    </div>    


                    <c:forEach items="${o.items}" var="i">
                        <div class="row border-top border-bottom">
                            <div class="row main align-items-center">

                                <div class="col-2">
                                    <img class="img-fluid" src="Image/${i.product.product_image}" style="width: 70px; height: 70px;">
                                </div>

                                <div class="col" style="font-size: 15px;">
                                    <div class="row text-muted">${i.product.product_name}</div>
                                </div>

                                <div class="col" style="text-align: center; display: flex; justify-content: center; align-items: center;">
                                    <button style="border-radius: 10px;"><a href="process?num=-1&id=${i.product.product_id}"><box-icon name='minus'></box-icon></a></button>

                                    <span style="padding: 0 8px;; font-size: 18px;">
                                        ${i.quantity}  
                                    </span>

                                    <button style="border-radius: 10px;"><a href="process?num=1&id=${i.product.product_id}"><box-icon name='plus' ></box-icon></a></button>
                                </div>

                                <div class="col">
                                    <span class="close" style="font-size: 16px;">
                                        $ <fmt:formatNumber pattern="##.##" value="${(i.price*i.quantity)}" />
                                    </span>
                                </div>

                                <div class="col" style="text-align: center; justify-self: center">
                                    <form action="process" method="post">
                                        <input type="hidden" name="id" value="${i.product.product_id}"/>
                                        <input style="border-radius: 5px;" type="submit" value="Return item"/>
                                    </form>
                                </div>

                            </div>
                        </div>
                    </c:forEach>


                    <div class="back-to-shop" style="font-size: 25px;"><a href="home">&leftarrow;Back to shop</a></div>

                </div>
                <div class="col-md-4 summary">
                    <div><h5><b>Summary</b></h5></div>
                    <hr>

                    <form>
                        <p>SHIPPING</p>
                        <select>
                            <option class="text-muted">Standard-Delivery</option>
                            <option class="text-muted">Fast-Delivery</option>
                        </select>
                        <p>GIVE CODE</p>
                        <input id="code" placeholder="Enter your code">
                    </form>

                    <div class="row" style="border-top: 1px solid rgba(0,0,0,.1); padding: 2vh 0;">
                        <div class="col">TOTAL PRICE</div>
                        <div class="col text-right">
                            $ <fmt:formatNumber pattern="##.##" value="${o.totalMoney}" />
                        </div>
                    </div>

                    <form action="checkout" method="post">
                        <input style="border-radius: 5px;" class="btn" type="submit"  value="Check out" />
                    </form>
                </div>
            </div>
        </div>



    </body>
</html>
