<%-- 
    Document   : admindeleteuser
    Created on : Oct 10, 2023, 11:47:41 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Delete Page</title>
    </head>
    <body>

        <%
            String id = (String)request.getAttribute("user_id");
        %>
        <h1>Delete User With ID : <%=id%></h1>
        <h1>Are you sure to delete this person's information?</h1>

        <form action="deleteUserByAdmin" method="post">
            <input type="hidden" name="id" value="<%=id%>">
            <input type="hidden" name="isDelete" value="1">

            <input type="submit" value="Yes" style="padding: 5px 20px">
        </form> 

        <form action="deleteUserByAdmin" method="post">
            <input type="hidden" name="id" value="<%=id%>">
            <input type="hidden" name="isDelete" value="0">

            <input type="submit" value="No" style="padding: 5px 20px">
        </form>

    </body>
</html>
