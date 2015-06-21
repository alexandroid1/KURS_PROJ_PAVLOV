<%-- 
    Document   : editGood
    Created on : 16.11.2014, 12:39:20
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
        <title>Edit good</title>
    </head>
    <body>
        <form method="POST" action="<c:url value="/shop/goodEditSave/${good.getId()}"/>">
            <input type="hidden" name="id" value="${good.getId()}" />
            <label for="name">Name:</label>
            <input type="text" name="name" value="${good.getName()}" />
            <label for="desc">Description:</label>
            <input type="text" name="desc" value="${good.getDescription()}" />
            <label for="price">Price:</label>
            <input type="text" name="price" value="${good.getPrice()}"/>
            <label for="cat">Category:</label>
            <select name="cat">
                <c:forEach items="${cats}" var ="cat">
                    <option <c:if test="${good.category_id} == ${cat.id}">selected</c:if>value="${cat.id}">${cat.name}</option>
                </c:forEach>
            </select>
            <input type="submit" />
        </form>
    </body>
</html>
