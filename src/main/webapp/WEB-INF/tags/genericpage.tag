<%@tag description="Overall Page template" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<%@attribute name="header" fragment="true" %>
<%@attribute name="footer" fragment="true" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>
        <jsp:invoke fragment="header"/>
    </title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/styles.css">
    <script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
    <meta name="theme-color" content="#7952b3">
</head>
<body>
<!--
    This header is inspired by this bootstrap
    example: https://getbootstrap.com/docs/5.0/examples/pricing/
-->
<header>

    <!-- NAVIGATION BAR -->
    <div class="topnav">
        <ul>
            <li>
                <a class="purple-small-link-button" href="fc/loginpage"><h4>Login</h4></a>
            </li>
            <li>
                <a class="link-button" href="fc/shoppingcartpage"><i class="fas fa-shopping-cart"></i></a>
            </li>
            <li>
                <a class="link-button"><h4>Find us</h4></a>
            </li>
            <li>
                <a class="link-button"><h4>Menu</h4></a>
            </li>
            <li>
                <c:if test="${addHomeLink == null }">
                    <a class="link-button" href="<%=request.getContextPath()%>"><h4>Home</h4></a>
                </c:if>
            </li>
        </ul>
    </div>
</header>


<jsp:doBody/>

<jsp:invoke fragment="footer"/>
<!-- LOGO -->
<img src="images/logo.png" style="position: fixed; left: 80px; top: 0; height: 150px">
</body>
</html>