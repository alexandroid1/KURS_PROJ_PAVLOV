<%-- 
    Document   : addUser
    Created on : 15.11.2014, 16:10:48
    Author     : Sereja
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
          <link rel="stylesheet" type="text/css" href="http://www.99lime.com/site/templates/css/kickstart.css" />
        <script type="text/javascript" src="http://www.99lime.com/site/templates/js/kickstart.js"></script>
        
         <link rel="stylesheet" type="text/css" href="http://www.templatemo.com/templates/templatemo_367_shoes/templatemo_style.css" />
        <link rel="stylesheet" type="text/css" href="http://www.templatemo.com/templates/templatemo_367_shoes/nivo-slider.css" />
        <link rel="stylesheet" type="text/css" href="http://www.templatemo.com/templates/templatemo_367_shoes/css/ddsmoothmenu.css" />
        <script type="text/javascript" src="http://www.templatemo.com/templates/templatemo_365_orando/js/jquery.min.js"></script>
        <script type="text/javascript" src="http://www.templatemo.com/templates/templatemo_365_orando/js/ddsmoothmenu.js"></script>
        <title>Add user</title>
    </head>
    <body>
        <form method="GET" action="<c:url value="/user/userSave"/>">
            <input type="hidden" name="id" />
            <label for="name">Name:</label>
            <input type="text" name="name" />
            <label for="email">Email:</label>
            <input type="text" name="email" />
            <label for="password">Password:</label>
            <input type="text" name="password" />
            <label for="isAdmin">Is admin:</label>
            <input type="checkbox" name="isAdmin" value="1"/>
            <input type="submit" />
        </form>
    </body>
</html>
