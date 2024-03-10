<%-- 
    Document   : header
    Created on : Nov 4, 2023, 8:12:20 PM
    Author     : Admin
--%>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="CSS/Home.css">


<div class="Header-Container col-md-12 align-items-center" style="width: 100%">
   
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