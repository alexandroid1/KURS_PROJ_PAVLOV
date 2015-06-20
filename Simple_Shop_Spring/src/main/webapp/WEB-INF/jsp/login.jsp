

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        
          <link rel="stylesheet" type="text/css" href="http://www.99lime.com/site/templates/css/kickstart.css" />
        <script type="text/javascript" src="http://www.99lime.com/site/templates/js/kickstart.js"></script>
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="http://www.templatemo.com/templates/templatemo_367_shoes/templatemo_style.css" />
        <link rel="stylesheet" type="text/css" href="http://www.templatemo.com/templates/templatemo_367_shoes/nivo-slider.css" />
        <link rel="stylesheet" type="text/css" href="http://www.templatemo.com/templates/templatemo_367_shoes/css/ddsmoothmenu.css" />
        <script type="text/javascript" src="http://www.templatemo.com/templates/templatemo_365_orando/js/jquery.min.js"></script>
        <script type="text/javascript" src="http://www.templatemo.com/templates/templatemo_365_orando/js/ddsmoothmenu.js"></script>
        <title>Login</title>
    </head>
    <body style="background-image:url(../../../java/Image/landscapes.jpg)">
  
                
                <ul class="sidebar_list">
                    <li><a href="<c:url value="/user/login" />"> Login</a> </li>  
                    <li><a href="<c:url value="/shop" />">Browse categories</a></li>
                    <li><a href="<c:url value="/user/show" />">Profile</a></li>   
                    <li><a href="<c:url value="/user/logout" />">Logout</a></li>
                </ul>
                <hr/>
    
    <body style="background-image:url(../../../resources/Image/krasivye.jpeg)">
        <div style="color: cyan;">
            
        </div>
        <div style="size: 20px; text-align: center">
            <form action="<c:url value="/j_spring_security_check" />" method="post">
                <label>Email: <input type="text" name="j_username" /></label>
                <label>Password: <input type="password" name="j_password" /></label>
                <div style="text-align: center;">
                    <input type="submit" />
                </div>               
            </form>
        </div>
    </body>
</html>