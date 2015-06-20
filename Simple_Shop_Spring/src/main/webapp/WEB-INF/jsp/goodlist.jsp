

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
          <link rel="stylesheet" type="text/css" href="http://www.99lime.com/site/templates/css/kickstart.css" />
        <script type="text/javascript" src="http://www.99lime.com/site/templates/js/kickstart.js"></script>
        <link rel="stylesheet" type="text/css" href="http://www.free-css.com/assets/files/free-css-templates/preview/page130/xtreme/style.css" />
        <title>Good List</title>
    </head>
    <body>
        <nav class="navbar navbar-inverse navbar-fixed-top">
            <div id="templatemo_menu" class="ddsmoothmenu">
                
                <ul class="nav navbar-nav">
                    <li><a href="<c:url value="/user/login" />"> Login</a> </li>  
                    <li><a href="<c:url value="/shop" />">Browse categories</a></li>
                    <li><a href="<c:url value="/user/show" />">Profile</a></li>
                    <li><a href="<c:url value="/user/logout" />">Logout</a></li>
                </ul>
            </div>
        </nav>
        
        <div id="templatemo_menu" class="ddsmoothmenu">
            <div class="jumbotron">
                <h1>Browse categories</h1>
            </div>
            <div class="row">
                <div class="col-md-6">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h3 class="panel-title">Categories</h3>
                        </div>
                        <div class="panel-body">
                            <ul>
                                <c:forEach items="${goods}" var="good">
                                    <li>${good.name} Price: ${good.price}<br/><a class="btn btn-success" href="<c:url value="/shop/add/${good.category_id}/${good.id}" />">Add to basket</a><c:if test="${current.isAdmin}">  <a class="btn btn-info" href="<c:url value="/shop/editGood/${good.category_id}/${good.id}" />">Edit</a>  <a class="btn btn-danger" href="<c:url value="/shop/delete/${good.category_id}/${good.id}" />">Delete</a></c:if></li>
                                </c:forEach>
                            </ul>
                            <c:if test="${current.isAdmin}">
                                <br/><div><a class="btn btn-success" href="<c:url value="/shop/addGood" />">Add good</a></div> 
                            </c:if>
                            
                        </div>
                    </div>
                </div>

                <div class="col-md-6">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h3 class="panel-title">Basket</h3>
                        </div>
                        <div class="panel-body">
                            <ul>
                                <c:forEach items="${basket}" var="item">
                                    <li>${item.value.good.name} : <span>${item.value.count}</span>  <a style="color: red" href="<c:url value="/shop/deleteGoodInBasket/${item.value.good.category_id}/${item.value.good.id}" />">-</strong></a></li>
                                </c:forEach>
                            </ul>  
                            <div><a class="btn btn-success" href="<c:url value="/shop/orderAdd" />">Order</a>  <a class="btn btn-primary" href="<c:url value="/shop/history/${thisUser.id}"/>">History</a> <a class="btn btn-danger" href="<c:url value="/shop/basketDelete"/>">Clear</a></div>
                        </div>  
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
