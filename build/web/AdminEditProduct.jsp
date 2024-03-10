<%-- 
    Document   : AdminEditProduct
    Created on : Oct 12, 2023, 12:35:49 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="model.category"%>
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
              product p = (product) request.getAttribute("p");              
        %> 


        <div class="container bg-white mt-5 mb-5" style="height: auto; border-radius: 20px;">
            <form class="d-flex flex-column justify-content-center align-items-center " style="height: auto" action="editProductByAdmin" method="post" enctype="multipart/form-data">
                <div class="col-md-4 border-right">
                    <div class="d-flex flex-column align-items-center text-center p-3 py-5">
                        <img class="rounded-circle mt-5" id="selectedImage" src="Image/<%=p.getProduct_image()%>" alt="Selected Image" width="300px;" height="300px;" >
                        <input type="hidden" name="image" value="${u.user_image}"/>
                        <hr style="color: black;">
                        <input type="file" name="photo" placeholder="Enter Photo" />
                    </div>
                </div>

                <div class="col-md-8 border-right" >
                    <div class="p-3 py-5" >
                        <div class="d-flex justify-content-center align-items-center mb-3" >
                            <h2 class="text-right" >Edit Product</h2>
                        </div>

                        <div class="row mt-3" >
                            <div class="col-md-12">
                                <input type="hidden" name="product_id" value="<%=p.getProduct_id()%>">                 
                                <label class="labels">Product-Name::</label>                          
                                <input class="form-control" type="text" name="product_name"  value="<%=p.getProduct_name()%>">                                
                            </div>
                            <div class="col-md-12">
                                <label class="labels">Product-Description:</label>
                                <textarea class="form-control" name="product_description" rows="8" cols="45" ><%=p.getProduct_description()%></textarea>
                            </div>
                            <div class="col-md-12">
                                <label class="labels">Product-Quantity:</label>
                                <input class="form-control" type="number" name="product_quantity" value="<%=p.getProduct_quantity()%>">
                            </div>
                            <div class="col-md-12">
                                <label class="labels">Product-Price:</label>
                                <input class="form-control" type="text" name="product_price" value="<%=p.getProduct_price()%>">
                            </div>

                            <%
                                List<category> categorys = (List<category>)request.getAttribute("categorys");
                            %>
                            <div class="col-md-12">
                                <label class="labels">Category:</label>
                                <select class="form-control" name="category_name">
                                    <% for (int i = 0; i < categorys.size(); i++) { %>
                                    <option value="<%=categorys.get(i).getCateegory_name()%>"><%=categorys.get(i).getCateegory_name()%></option>
                                    <% } %>
                                </select>
                            </div>
                        </div>
                        <div class="mt-5 text-center">
                            <input class="btn btn-primary profile-button" type="submit" value="Edit" name="btn"/>
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
