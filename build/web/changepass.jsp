<%-- 
    Document   : changepass
    Created on : Oct 17, 2023, 2:59:09 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

        <title>JSP Page</title>

        <style>
            body {
                background-color: #DDDDDD;
            }

            .card {
                box-shadow: 3px 11px 16px 14px rgba(0, 0, 0, 0.1);
                border-radius: 10px;
                background-color: white;
            }

            .bodycontentmain {
                /*                background-color: #DDDDDD;*/
            }
        </style>

    </head>
    <body>


        <c:set var="i" value="${sessionScope.CurrentPass}"/>

        <div class="container my-5">
            <div class="row justify-content-center">
                <div class="col-md-6">
                    <div class="card">
                        <div class="card-body">
                            <h1 class="card-title">Change Password</h1>
                            <hr>
                            <form action="changePass" method="post" class="bodycontentmain">
                                <div class="mb-3">
                                    <input class="dulieu" type="hidden" name="CurrentPassword1" value="${i}" />
                                    <label for="currentPassword" class="form-label">Current Password</label>
                                    <input type="password" class="form-control" id="currentPassword" name="CurrentPassword2" required>
                                </div>
                                <div class="mb-3">
                                    <label for="newPassword" class="form-label">New Password</label>
                                    <input type="password" class="form-control" id="newPassword" name="NewPassword" required>
                                </div>
                                <div class="mb-3">
                                    <label for="confirmPassword" class="form-label">Confirm New Password</label>
                                    <input type="password" class="form-control" id="confirmPassword" name="ConfirmPassword" required>
                                </div>
                                <hr>
                                <div>
                                    <button type="submit" class="btn btn-primary">Change Password</button>
                                </div>  
                                <div style="color: red; font-size: 20px; margin-top: 10px;">
                                    <c:if test="${requestScope.err != null}" >
                                        ${requestScope.err}
                                    </c:if> 
                                </div>


                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>




    </body>
</html>
