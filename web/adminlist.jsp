<%-- 
    Document   : adminlist
    Created on : Oct 4, 2023, 3:05:55 AM
    Author     : Hoang's LEGION
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="model.User"%>
<%@page import="model.product"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="https://unpkg.com/boxicons@2.1.4/dist/boxicons.js"></script>
        <script src="https://kit.fontawesome.com/2eca86e2a2.js" crossorigin="anonymous"></script>
        <title>JSP Admin</title>

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




                <!--                <h1>Admin</h1>-->

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

<!--                <form action="adminlist" class="function">
                    <button class="button" style="width: 100%;">
                        <box-icon name='category' type='solid' ></box-icon> 
                        <span>Category</span>
                                                <input type="hidden" name="name" value="category" />
                    </button>
                </form>-->

                <form action="logoutServlet" class="function">
                    <button class="button" style="width: 100%;">
                        <box-icon name='log-out' ></box-icon>
                        <span>Logout</span>
                        <input type="hidden" name="name" value="logout" />
                    </button>
                </form>


            </div>


            <div class="right">

                <%
                        List<User> user = (List<User>) request.getAttribute("UserList");
                            if (user != null) {
                              
                %>

                <div class="col-md-12" style="padding: 20px 20px;"> 

                    <div class="blank">

                    </div>

                    <table border="1px" style="width: 100%; text-align: center;">
                        <thead>
                        <th>Name</th>
                        <th>Password</th>
                        <th>Email</th>
                        <th>Phone</th>
                        <th>Image</th>
                        <th>Action1</th>
                        <th>Action2</th>
                        <th>Action3</th>
                        </thead>
                        <tbody>
                            <%                               
                                
                                    for (int i = 0; i < user.size(); i++) {
                            %>
                            <tr>
                                <td><%=user.get(i).getUser_name()%></td>
                                <td><%=user.get(i).getUser_password()%></td>
                                <td><%=user.get(i).getUser_email()%></td>
                                <td><%=user.get(i).getUser_phone()%></td>

                                <td><img value="" class="productImage" src="Image/<%=user.get(i).getUser_image()%>" alt="alt"  /></td>


                                <td>
                                    <form action="editUser">
                                        <input type="hidden" name="user_id" value="<%=user.get(i).getUser_id()%>">
                                        <input type="submit" value="Edit">
                                    </form>

                                </td>
                                <td>
                                    <form action="deleteUserByAdmin">
                                        <input type="hidden" name="user_id" value="<%=user.get(i).getUser_id()%>">
                                        <input type="submit" value="Delete">
                                    </form>           
                                </td>
                                <td>
                                    <form action="productdetailuser">
                                        <input type="hidden" name="name" value="<%=user.get(i).getUser_name()%>">
                                        <input type="submit" value="Detail">
                                    </form>           
                                </td>
                            </tr>
                            <%
                                
                                   }  
                            %>
                        </tbody>    
                        <tfoot>
                            <tr>
                                <td colspan="10">
                                    <div class="insert">
                                        <form action="insertUser">
                                            <input type="submit" value="Insert New Account">
                                        </form>
                                    </div>
                                </td>
                            </tr>
                        </tfoot>
                    </table>
                </div>
                <%                              
                        }  
                %>




                <%
                        List<product> products = (List<product>) request.getAttribute("ProductList");
                            if (products != null) {
                           
                %>

                <div class="col-md-12" style="padding: 20px 20px;">


                    <div class="blank">

                    </div>

                    <table border="1px" style="width: 100%; text-align: center;">
                        <thead>
                        <th>Product_ID</th>
                        <th>Category_ID</th>
                        <th>Category_Name</th>
                        <th>Product_Name</th>
                        <th>Product_Image</th>
                        <th>Product_Description</th>
                        <th>Product_Quantity</th>
                        <th>Product_Price</th>
                        <th>Action</th>
                        </thead>
                        <tbody>
                            <%
                                    for (int x = 0; x < products.size(); x++) {
                            %>
                            <tr>
                                <td><%=products.get(x).getProduct_id()%></td>
                                <td><%=products.get(x).getCategory().getCategory_id()%></td>
                                <td><%=products.get(x).getCategory().getCateegory_name()%></td>
                                <td><%=products.get(x).getProduct_name()%></td>


                                <td><img class="productImage" src="Image/<%=products.get(x).getProduct_image()%>" alt="alt" /></td>
                                <td><%=products.get(x).getProduct_description()%></td>


                                <td><%=products.get(x).getProduct_quantity()%></td>
                                <td><%=products.get(x).getProduct_price()%></td>
                                <td>
                                    <form action="editProductByAdmin" >
                                        <input type="hidden" name="product_image" value="<%=products.get(x).getProduct_image()%>">
                                        <input type="hidden" name="product_id" value="<%=products.get(x).getProduct_id()%>">
                                        <input type="submit" value="Edit">
                                    </form>
                                    <form action="deleteProductByAdmin">
                                        <input type="hidden" name="product_id" value="<%=products.get(x).getProduct_id()%>">
                                        <input type="submit" value="Delete">
                                    </form>           
                                </td>
                            </tr>
                            <%
                                }
                            %>
                        </tbody>    
                        <tfoot>
                            <tr>
                                <td colspan="10">
                                    <div class="insert">
                                        <form action="insertProductByAdmin">
                                            <input type="submit" value="Insert New Product">
                                        </form>
                                    </div>
                                </td>
                            </tr>
                        </tfoot>
                    </table>
                </div>
                <%                              
                    }  
                %>


            </div>
        </div>


    </body>
</html>
