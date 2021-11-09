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

        <c:if test="${sessionScope.user != null}">
            <p>Hello ${sessionScope.user.firstname}</p>
        </c:if>

        <ul>
            <li>
                <c:set var="thisPage" value="${pageContext.request.servletPath}"/>
                <c:set var="isNotLoginPage" value="${!fn:endsWith(thisPage,'loginpage.jsp')}"/>
                <c:set var="isNotRegisterPage" value="${!fn:endsWith(thisPage,'registerpage.jsp')}"/>

                <c:if test="${isNotLoginPage && isNotRegisterPage}">
                    <c:if test="${sessionScope.user == null }">
                        <a type="button" class="purple-small-link-button" href="${pageContext.request.contextPath}/fc/loginpage"><h4>
                            Login</h4></a>

                    </c:if>
                    <c:if test="${sessionScope.user != null}">
                        <a type="button" class="purple-small-link-button" href="${pageContext.request.contextPath}/fc/logoutcommand">
                            <h4>
                                Logout</h4></a>
                    </c:if>

                </c:if>

            </li>
            <li>
                <a class="link-button" href="${pageContext.request.contextPath}/fc/shoppingcartpage"><i
                        class="fas fa-shopping-cart"></i></a>
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
<img src="${pageContext.request.contextPath}/images/logo.png" style="position: fixed; left: 80px; top: 0; height: 150px">


</body>
</html>