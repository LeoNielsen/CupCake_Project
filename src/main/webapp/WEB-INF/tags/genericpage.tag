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
                <a class="purple-small-button" href="fc/logincommand"><h4>Login</h4></a>
            </li>
            <li>
                <a class="shopping-cart-button"><i class="fas fa-shopping-cart"></i></a>
            </li>
            <li>
                <a class="shopping-cart-button"><h4>Find us</h4></a>
            </li>
            <li>
                <a class="shopping-cart-button"><h4>Menu</h4></a>
            </li>
            <li>
                <c:if test="${addHomeLink == null }">
                    <a class="shopping-cart-button" href="<%=request.getContextPath()%>"><h4>Home</h4></a>
                </c:if>
            </li>
        </ul>
    </div>


    <!-- LOGO -->
    <img src="images/logo.png" style="position: fixed; left: 80px; top: 0; height: 150px">
</header>



    <!--
    <div class="my-0 me-md-auto fw-normal">
        <img src="images/index.png" alt="Logo" height="80" width="70"/>
        email@email.com
    </div>
    <div class="h5 me-md-auto fw-normal">
        <p style="font-size: larger; text-align: center">
            <jsp:invoke fragment="header"/>
        </p>
    </div>

    <nav class="my-2 my-md-0 me-md-3">
        <c:if test="${addHomeLink == null }">
            <a class="p-2 text-dark" href="<%=request.getContextPath()%>">Home</a>
        </c:if>
        <a class="p-2 text-dark" href="#">Menu</a>
        <a class="p-2 text-dark" href="#">Find Us</a>
        <a class="p-2 text-dark" href="#"><img src="images/shopping chart.png" alt="Cart" height="20" width="20"/></a>
    </nav>

    <div>

        <c:if test="${sessionScope.user != null }">
            ${sessionScope.user.email}
        </c:if>

        <c:set var="thisPage" value="${pageContext.request.servletPath}"/>
        <c:set var="isNotLoginPage" value="${!fn:endsWith(thisPage,'loginpage.jsp')}"/>
        <c:set var="isNotRegisterPage" value="${!fn:endsWith(thisPage,'registerpage.jsp')}"/>

        <c:if test="${isNotLoginPage && isNotRegisterPage}">
        <c:if test="${sessionScope.user != null }">
            <a type="button" class="btn btn-sm  btn-outline-secondary"
               href="${pageContext.request.contextPath}/fc/logoutcommand">Logout</a>
        </c:if>
        <c:if test="${sessionScope.user == null }">
            <a type="button" class="btn btn-sm  btn-outline-secondary"
               href="${pageContext.request.contextPath}/fc/loginpage">Login</a>
            <a type="button" class="btn btn-sm  btn-outline-secondary"
               href="${pageContext.request.contextPath}/fc/registerpage">Sign up</a>
        </c:if>
    </div>
    </c:if>
</header>

<div id="body" class="container" style="min-height: 20vh;">
    <jsp:doBody/>
</div>

-->
<!-- Footer
<div class="container">
    <br>
    <hr>
    <br>
    <jsp:invoke fragment="footer"/>
</div>
-->
</body>
</html>