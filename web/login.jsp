<%-- 
    Document   : login
    Created on : Sep 29, 2023, 5:17:13 PM
    Author     : Hoang's LEGION
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <!--        <link rel="stylesheet" href="login_signup.css">-->
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
        <link rel="stylesheet" href="CSS/Login.css">
        <script src="https://kit.fontawesome.com/2eca86e2a2.js" crossorigin="anonymous"></script>

        <style>
            /*            .input-box {
                            margin-bottom: 20px;
                        }*/
        </style>
    </head>
    <body>
        <div class="wrapper">
            <!--            --------------------------- Nav ---------------------------------  -->
            <!--            <nav class="nav">
                            <div class="nav-menu" id="navMenu">
                                <ul>
                                    <li><a href="home" class="link">Home</a></li>
                                    <li><a href="#" class="link">Blog</a></li>
                                    <li><a href="#" class="link">Services</a></li>
                                    <li><a href="#" class="link">About</a></li>
                                </ul> 
                            </div>
                        </nav>-->

            <!----------------------------- Form box ----------------------------------->    
            <div class="form-box">

                <c:set var="cookie" value="${pageContext.request.cookies}"/>
                <!------------------- login form -------------------------->

                <div class="login-container" id="login">
                    <form action="login" method="POST">
                        <header>Login Form</header>
                        <div class="input-box">
                            <input type="text" class="input-field" placeholder="Username or Email" name="username" value="${cookie.cuser.value}">
                            <i class="bx bx-user"></i>

                        </div>
                        <div class="input-box">
                            <input type="password" class="input-field" placeholder="Password" name="password" id="passwordField" value="${cookie.cuser.value}">
                            <i class="bx bx-lock-alt" id="togglePassword"></i>
                        </div>
                        <div class="input-box">
                            <input type="submit" class="submit" value="Sign In">
                        </div>
                        <div class="two-col">
                            <div class="one">
                                <input type="checkbox" ${(cookie.crem!=null?'checked':'')} name="rem" value="ON" />Remember Me

                            </div>

                            <div class="two">
                                <label><a href="#">Forgot password?</a></label>
                            </div>
                        </div>

                        <div class="bottom">
                            <span>Don't have an account? <a href="#" onclick="register()">Sign Up</a></span>

                        </div>

                        <div class="message-container">

                            <c:if test="${err!=null}">
                                <div class="message">
                                    <h4 style="color: red;">${err}</h4>
                                </div>
                            </c:if>


                            <br>
                            <%
                            String message2 = (String) request.getAttribute("data2"); 
                            %>
                            <% if (message2 != null) { %>           
                            <div class="message">
                                <h3 style="color: green;" ><%= message2 %></h3>
                            </div>
                            <% } %>
                            <br>
                            <%
                            String message1 = (String) request.getAttribute("data1"); // Sử dụng getAttribute để lấy giá trị của thuộc tính "data"
                            %>
                            <% if (message1 != null) { %>           
                            <div class="message">
                                <h3 style="color: red;" ><%= message1 %></h3>
                            </div>
                            <% } %>
                            <br>
                            <%
                            String message3 = (String) request.getAttribute("data3"); // Sử dụng getAttribute để lấy giá trị của thuộc tính "data"
                            %>
                            <% if (message3 != null) { %>           
                            <div class="message">
                                <h3 style="color: red;" ><%= message3 %></h3>
                            </div>
                            <% } %>

                        </div>
                    </form> 
                </div>


                <!------------------- registration form -------------------------->
                <div class="register-container" id="register">
                    <form action="LoginSignUp" method="POST">
                        <header>Sign Up Form</header>                    
                        <div class="input-box">
                            <input type="text" class="input-field" placeholder="*Username or Email(Not Empty)" name="username" required>
                            <i class="bx bx-user"></i>
                        </div>
                        <div class="input-box">
                            <input type="password" class="input-field" placeholder="Password (At least 1 Digit && Over 8 characters)" name="password" id="passwordField" required>
                            <i class="bx bx-lock-alt" id="togglePassword"></i>
                        </div>
                        <div class="input-box">
                            <input type="email" class="input-field" name="email"placeholder="Email(Optional)" >
                            <i class="bx bx-envelope"></i>
                        </div>
                        <div class="input-box">
<!--                            <input type="text" class="input-field" name="phone"placeholder="Phone(Not Empty)" required>-->
                            <input class="input-field" id="phone" type="tel"  pattern="[0-9]{3}[0-9]{4}[0-9]{3}" name="phone" placeholder="Phone(Not Empty)" required />

                            <i class='bx bx-phone'></i>
                            



                        </div>
                        <div class="input-box">
                            <input type="submit" class="submit" value="Register">
                        </div>
                        <div class="two-col">
                            <div class="one">
                                <input type="checkbox" id="register-check">
                                <label for="register-check"> Remember Me</label>
                            </div>
                            <div class="two">
                                <label><a href="#">Terms & conditions</a></label>
                            </div>
                        </div>
                        <div class="bottom">
                            <span>Have an account? <a href="#" onclick="login()">Login</a></span>

                        </div>

                    </form>
                </div>
            </div>

        </div>   


        <!--        <script>
        //            function togglePasswordVisibility() {
        //                const passwordField = document.getElementById("passwordField");
        //                const togglePassword = document.getElementById("togglePassword");
        //
        //                if (passwordField.type === "password") {
        //                    passwordField.type = "text";
        //                    togglePassword.classList.remove("bx-lock-alt");
        //                    togglePassword.classList.add("bx-show-alt"); // You may need to adjust this class
        //                } else {
        //                    passwordField.type = "password";
        //                    togglePassword.classList.remove("bx-show-alt");
        //                    togglePassword.classList.add("bx-lock-alt");
        //                }
        //            }
                </script>-->


        <script>
            let msgElement = document.querySelector('.message-container');
            if (msgElement.innerText) {
                msgElement.classList.add('hide');
                setTimeout(() => {
                    msgElement.remove();
                }, 3000);
            }
        </script>

        <script>
            var x = document.getElementById("login");
            var y = document.getElementById("register");
            function login() {
                x.style.left = "4px";
                y.style.right = "-520px";
                x.style.opacity = 1;
                y.style.opacity = 0;
            }

            function register() {
                x.style.left = "-510px";
                y.style.right = "5px";
                x.style.opacity = 0;
                y.style.opacity = 1;
            }
        </script>

    </body>
</html>
