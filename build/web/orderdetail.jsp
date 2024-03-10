<%-- 
    Document   : orderdetail
    Created on : Nov 8, 2023, 4:46:30 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>

        <script src="https://unpkg.com/boxicons@2.1.4/dist/boxicons.js"></script>
        <script src="https://kit.fontawesome.com/2eca86e2a2.js" crossorigin="anonymous"></script>
        <!-- Custom CSS -->

        <style>

            body {
                margin: 0;
                padding: 0;
                width: 100%;
                display: flex;
                font-family: Cera Pro,sans-serif;

            }

            .Container {
                background-color: white;

                width: 100%;
                display: flex; /* Sử dụng flexbox để chia phần tỷ lệ */
            }

            .left {

                flex: 15%; /* Chiếm 25% */
                margin-right:  0.5%;

                position: fixed; /* Đặt phần "left" ở vị trí cố định */
                left: 0;
                height: 100vh;
                width: 15%;
                padding-left: 10px;
                text-align: center;
                background-color: #F8FBFA;

            }

            .function{
                padding: 5px 0;
                align-items: first;
            }

            .button{
                border: none;
                background-color: #F8FBFA;
                border-radius: 10px;
                display: flex;
                align-items:  center;
                justify-content: left;
                height: 40px;
                font-size: 18px;
            }
            .button span{
                margin-left: 15px;
            }

            .button:hover{

                background-color: #c9c4c4;
            }



            .leftBody{
                display: flex;
                flex-direction: column;
            }

            .right {
                flex: 80%; /* Chiếm 60% */
                overflow: auto;
                margin-left: 18%;
            }

            .blank{
                height: 100px;
                width: 100;
            }

            .productImage{
                width: 100px;
                height: 60px;
            }
            table{
                border-collapse: collapse;
            }

        </style>
    </head>
    <body>

        <div class="Container">
            <div class="left">

                <a href="adminlist" style="text-decoration: none;">
                    <h1 >ADMIN</h1>
                </a>

                <form action="adminlist" class="function">
                    <button class="button" style="width: 100%;">
                        <box-icon name='user' type='solid' ></box-icon>
                        <span>User</span>
                        <input type="hidden" name="name" value="user" />
                    </button>
                </form>

                <form action="adminlist" class="function">
                    <button class="button" style="width: 100%;">
                        <box-icon type='solid' name='package'></box-icon> 
                        <span>Product</span>
                        <input type="hidden" name="name" value="product" />
                    </button>
                </form>

                <form action="order" class="function">
                    <button class="button" style="width: 100%;">
                        <box-icon name='history'></box-icon>                        
                        <span>History</span>                       
                    </button>
                </form>

                <form action="feedback" class="function" method="post">
                    <button class="button" style="width: 100%;">
                        <box-icon name='message-dots' ></box-icon>                    
                        <span>FeedBack</span>                       
                    </button>
                </form>

                <form action="logoutServlet" class="function">
                    <button class="button" style="width: 100%;">
                        <box-icon name='log-out' ></box-icon>
                        <span>Logout</span>
                        <input type="hidden" name="name" value="logout" />
                    </button>
                </form>
            </div>


            <div class="right">

                <c:if test="${requestScope.list != null}"  >
                    <div class="col-md-12" style="padding: 20px 20px;">
                        <table border="1" style="width: 100%; text-align: center;">
                            <thead >
                                <tr>
                                    <th>Name</th>
                                    <th>Image</th>
                                    <th>Price</th>
                                    <th>Quantity</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${requestScope.list}" var="l">
                                    <tr>
                                        <td class="col-md-4">${l.od_name}</td>
                                        <td class="col-md-4">
                                            <img src="Image/${l.od_image}" width="200px;" height="200px;" alt="alt"/>
                                        </td>
                                        <td class="col-md-2">${l.od_price}</td>
                                        <td class="col-md-2">${l.od_quantity}</td>                               
                                    </tr>                       
                                </c:forEach>
                            </tbody>
                        </table>
                    </div> 
                </c:if>
            </div>
        </div>



    </body>
</html>
