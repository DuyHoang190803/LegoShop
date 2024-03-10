<%-- 
    Document   : profile
    Created on : Nov 3, 2023, 2:22:27 PM
    Author     : Admin
--%>

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
        <c:set value="${requestScope.user}" var="u"/>


        <div class="container bg-white mt-5 mb-5" style="height: auto; border-radius: 20px;">
            <!--            <div class="row justify-content-center">-->
            <form class="d-flex flex-column justify-content-center align-items-center " style="height: auto" action="profile" method="POST" enctype="multipart/form-data">

                <div class="col-md-4 border-right">
                    <div class="d-flex flex-column align-items-center text-center p-3 py-5">
                        <img id="selectedImage" class="rounded-circle mt-5"  src="Image/${u.user_image}" alt="Selected Image" width="250px";>
                        <input type="hidden" name="image" value="${u.user_image}"/>
                        <hr style="color: black;">
                        <input type="file" name="photo" placeholder="Enter Photo"  />
                    </div>
                </div>

                <div class="col-md-8 border-right" >
                    <div class="p-3 py-5" >
                        <div class="d-flex justify-content-center align-items-center mb-3" >
                            <h2 class="text-right" >Profile Settings</h2>
                        </div>

                        <div class="row mt-3" >
                            <div class="col-md-12">
                                <input type="hidden" name="pass" value="${u.user_password}"/>
                                <input type="hidden" name="id" value="${u.user_id}"/>
                                <label class="labels">UserName:</label>
                                <input type="text" class="form-control" name="name" value="${u.user_name}"/>
                            </div>
                            <div class="col-md-12">
                                <label class="labels">Email:</label>
                                <input type="email" class="form-control" name="mail" value="${u.user_email}" required/>

                            </div>



                            <div class="col-md-12">
                                <label class="labels">Phone:</label>
                                
                                <input class="form-control" id="phone" type="tel"  pattern="[0-9]{3}[0-9]{4}[0-9]{3}" name="phone" required value="${u.user_phone}"/>



<!--                                <input type="text" class="form-control" name="phone" value="${u.user_phone}" />-->
                            </div>
                        </div>
                        <div class="mt-5 text-center">
                            <input class="btn btn-primary profile-button" type="submit" value="Edit" name="btn"/>
                            <input class="btn btn-primary profile-button" type="submit" value="Cancel"  name="btn"/>
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
