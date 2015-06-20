

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
        <title>Categories</title>
    </head>
    <body>
        <nav class="navbar navbar-inverse navbar-fixed-top">
            <div class="container">
                
                <ul class="sidebar_list">
                    <li><a href="<c:url value="/user/login" />"> Login</a> </li>  
                    <li><a href="<c:url value="/shop" />">Browse categories</a></li>
                    <li><a href="<c:url value="/user/show" />">Profile</a></li>   
                    <li><a href="<c:url value="/user/logout" />">Logout</a></li>
                </ul>
            </div>
        </nav>
        
        <div class="container">
            <div class="jumbotron">
                <h1>Browse categories</h1>
            </div>
            <div class="row">
                <div class="col-md-6">
                    <div>
                        <div class="panel-heading">
                            <h3 class="panel-title">Categories</h3>
                        </div>
                        <div>
                            <ul>
                                <c:forEach items="${cats}" var="cat">
                                    <li><a class="button" href="<c:url value="/shop/category/${cat.id}" />"> ${cat.name}</a></li>
                                </c:forEach>
                            </ul>
                        </div>
                    </div>
                </div>

                <div class="col-md-6">
                    <div id="templatemo_menu" class="ddsmoothmenu">
                        <div class="panel-heading">
                            <h3 class="panel-title">Basket</h3>
                        </div>
                        <div class="panel-body">
                            <ul>
                                <c:forEach items="${basket}" var="item">
                                    <li>${item.value.good.name} : <span>${item.value.count}</span></li>
                                </c:forEach>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
