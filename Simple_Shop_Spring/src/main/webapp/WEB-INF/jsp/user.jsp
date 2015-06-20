

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
        <title>User</title>
    </head>
    <body style="background-image:url(../../../java/Image/landscapes.jpg)">
      
                
                <ul class="sidebar_list">
                    <li><a href="<c:url value="/user/login" />"> Login</a> </li>  
                    <li><a href="<c:url value="/shop" />">Browse categories</a></li>
                    <li><a href="<c:url value="/user/show" />">Profile</a></li>   
                    <li><a href="<c:url value="/user/logout" />">Logout</a></li>
                </ul>
                
                <hr/>
   
        
        <div class="container">
            <div class="jumbotron">
                <h1>${current.name}'s Profile</h1>
            </div>
            <div class="row">
                <div class="col-md-6">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h3 class="panel-title">Selected User</h3>
                        </div>
                        <div class="panel-body" style="background-color: activeborder">
                            <ul>
                                <c:if test="${current.isAdmin}">
                                    <c:forEach items="${users}" var="user1">
                                        <li>Name: ${user1.name}, Email: ${user1.email}, Password: ${user1.password},  Is admin?: <c:if test="${user1.isAdmin == true}">Yes </c:if><c:if test="${user1.isAdmin != true}">No </c:if><br/><a class="btn btn-info" href="<c:url value="/user/editUser/${user1.id}" />">Edit user</a>  <a class="btn btn-danger" href="<c:url value="/user/delete/${user1.id}" />">Delete user</a></li>
                                    </c:forEach>
                                        <br/><div><a class="btn btn-success" href="<c:url value="/user/addUser" />">Add user</a></div> 
                                </c:if>
                            </ul>
                            <div style="color: red">
                                <c:if test="${!current.isAdmin}">
                                    Access denied!
                                </c:if>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-md-6">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h3 class="panel-title">Current User</h3>
                        </div>
                        <div class="panel-body" style="background-color: activeborder">
                            <div>Name: ${current.name}</div>
                            <div>Email: ${current.email}</div>
                            <div>Is admin?: <c:if test="${current.isAdmin == true}">Yes </c:if><c:if test="${current.isAdmin != true}">No </c:if></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
