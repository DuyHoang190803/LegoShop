<%-- 
    Document   : AdminDeleteProduct
    Created on : Oct 12, 2023, 12:23:53 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>


        <a href="https://www.facebook.com/profile.php?id=100016526670401">day ne</a>
        
        
        <c:set var="o" value="${requestScope.id}"/>

        <h1>Delete Product With ID : ${o}</h1>
        <h1>Are you sure to delete this Product?</h1>

        <form action="deleteProductByAdmin" method="post">
            <input type="hidden" name="id" value="${o}">
            <input type="hidden" name="isDelete" value="1">

            <input type="submit" value="Yes" style="padding: 5px 20px">
        </form>

        <form action="deleteProductByAdmin" method="post">
            <input type="hidden" name="id" value="${o}">
            <input type="hidden" name="isDelete" value="0">

            <input type="submit" value="No" style="padding: 5px 20px">
        </form>

    </body>
</html>
