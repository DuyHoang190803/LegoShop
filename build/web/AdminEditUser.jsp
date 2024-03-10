<%-- 
    Document   : AdminEditUser
    Created on : Oct 8, 2023, 3:43:11 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="model.User"%>
<%@page import="model.product"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Edit Page</title>

        <!-- Bootstrap CSS -->
        <script src="https://unpkg.com/boxicons@2.1.4/dist/boxicons.js"></script>
        <script src="https://kit.fontawesome.com/2eca86e2a2.js" crossorigin="anonymous"></script>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://getbootstrap.com/docs/5.3/assets/css/docs.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Custom CSS -->


        <style>
            body{
                background-color: #DDDDDD;
            }

            .container{
                margin: 0 auto;
                height: 100vh;
                width: 50%;
                align-items: center;
                justify-content: center;
                display: flex;
                box-shadow: 0 6px 20px 0 rgba(0, 0, 0, 0.19);
                border-radius: 1rem;
                border: transparent;
            }
            .content{
                align-items: center;
                justify-content: center;
                display: flex;
                width:  100%;
            }
        </style>
    </head>
    <body>
        <%
           User u = (User) request.getAttribute("u");
        %>




        <div class="container bg-white mt-5 mb-5" style="height: auto; border-radius: 20px;">
            <!--            <div class="row justify-content-center">-->
            <form class="d-flex flex-column justify-content-center align-items-center " style="height: auto" action="editUser" method="post" enctype="multipart/form-data">

                <div class="col-md-4 border-right">
                    <div class="d-flex flex-column align-items-center text-center p-3 py-5">
<!--                        <img id="selectedImage" src="Image/<%=u.getUser_image()%>" alt="Selected Image" width="200px;" height="200px;" >-->

                        <img style="border: 2px #4CAF50 solid; height: 250px;" id="selectedImage" class="rounded-circle mt-5"  src="Image/<%=u.getUser_image()%>" alt="Selected Image" width="250px";>
                        <input type="hidden" name="image" value="${u.user_image}"/>
                        <hr style="color: black;">
                        <input type="file" name="photo" placeholder="Enter Photo"  />
                    </div>
                </div>

                <div class="col-md-8 border-right" >
                    <div class="p-3 py-5" >
                        <div class="d-flex justify-content-center align-items-center mb-3" >
                            <h2 class="text-right" >Edit User</h2>
                        </div>

                        <div class="row mt-3" >
                            <div class="col-md-12">
                                <input type="hidden" name="ID" value="<%=u.getUser_id()%>">
                                <label class="labels">UserName:</label>
                                <input class="form-control" type="text" name="Name" value="<%=u.getUser_name()%>">
                            </div>
                            <div class="col-md-12">
                                <label class="labels">Password:</label>
                                <input class="form-control" type="text"  name="Password"  value="<%=u.getUser_password()%>">     
                            </div>
                            <div class="col-md-12">
                                <label class="labels">Email:</label>

                                <input class="form-control" type="email" name="Email"  value="<%=u.getUser_email()%>">

                            </div>
                            <div class="col-md-12">
                                <label class="labels">Phone:</label>
                                <input class="form-control" id="phone" type="tel"  pattern="[0-9]{3}[0-9]{4}[0-9]{3}" name="Phone" required value="<%=u.getUser_phone()%>"/>



                            </div>
                        </div>
                        <div class="mt-5 text-center">
                            <input class="btn btn-primary profile-button" type="submit" value="Edit" name="btn"/>
                            <!--                            <input class="btn btn-p rimary profile-button" type="submit" value="Cancel"  name="btn"/>-->
                            <button  class="btn btn-primary profile-button" >
                                <a href="adminlist" style="color: white; text-decoration: none;">Cancel</a>
                            </button>
                        </div>
                    </div>
                </div>
            </form> 
        </div>




        <script>
            // Bắt sự kiện khi thay đổi tệp
            document.querySelector('input[type="file"]').addEventListener('change', function () {
                var fileInput = this;
                var selectedImage = document.getElementById('selectedImage');

                // Kiểm tra xem có tệp được chọn không
                if (fileInput.files && fileInput.files[0]) {
                    var reader = new FileReader();

                    reader.onload = function (e) {
                        // Thiết lập nguồn hình ảnh của thẻ img với dữ liệu hình ảnh đã chọn
                        selectedImage.src = e.target.result;
                    };

                    // Đọc tệp hình ảnh và hiển thị
                    reader.readAsDataURL(fileInput.files[0]);
                }
            });
        </script>

    </body>
</html>
