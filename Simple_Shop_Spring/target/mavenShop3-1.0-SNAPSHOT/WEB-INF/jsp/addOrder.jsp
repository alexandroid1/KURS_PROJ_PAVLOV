<%-- 
    Document   : addOrder
    Created on : 16.11.2014, 22:58:12
    Author     : Sereja
--%>

<%@page import="org.itstep.java.web.mavenShop3.model.Order"%>
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
        <title>JSP Page</title>
    </head>
    <body>
         <form method="GET" action="<c:url value="/shop/saveOrder"/>">
             <div class="col-md-6">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h3 class="panel-title">Order</h3>
                        </div>
                        <div id="templatemo_menu" class="ddsmoothmenu">
                            <ul sidebar_list>
                                <input type="hidden" name="id" value="${thisUser.id}" />
                                 <div>
                                     <label for="name">Name: </label>
                                     <input type="text" name="userName" value="${current.name}" readonly="readonly" />
                                 </div>
                                 <div>
                                    <label for="name">Delivery Address : </label>
                                    <input type="text" name="DeliverAddress" value="" />
                                 </div>
                            </ul>  
                                 <input type="submit"/>
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
                                <c:forEach items="${basket}" var="item" >
                                    <li>Name : ${item.value.good.name} : qiantity : <span>${item.value.count}</span></li>
                                </c:forEach>
                            </ul>  
                        </div>  
                    </div>
                </div>               
        </form>                                    
    </body>
</html>
