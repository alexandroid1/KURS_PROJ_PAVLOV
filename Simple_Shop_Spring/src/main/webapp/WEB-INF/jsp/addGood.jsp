

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
        <form method="GET" action="<c:url value="/shop/goodAddSave"/>">
            <input type="hidden" name="id" />
            <label for="name">Name:</label>
            <input type="text" name="name" />
            <label for="desc">Description:</label>
            <input type="text" name="desc" />
            <label for="price">Price:</label>
            <input type="text" name="price" />
            <label for="cat">Category:</label>
            <select name="cat">
                <c:forEach items="${cats}" var ="cat">
                    <option value="${cat.id}">${cat.name}</option>
                </c:forEach>
            </select>
            <input type="submit" />
        </form>
    </body>
</html>
