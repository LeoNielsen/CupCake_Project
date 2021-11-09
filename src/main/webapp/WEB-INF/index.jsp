<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<t:genericpage>

    <jsp:attribute name="header">
         Home
    </jsp:attribute>

    <jsp:attribute name="footer">
        <c:set var="addHomeLink" value="${false}" scope="request"/>
    </jsp:attribute>

    <jsp:body>

        <!-- IMAGE BANNER -->
        <div class="img-container" style="background-image: url('images/img.png')">
            <div class="inner-container">
                <h1>Welcome to Olsker Cupcake</h1>
                <h3>Det er endnu et dybdeøkologisk iværksættereventyr fra Bornholm, som har ramt den helt rigtige
                    opskrift.</h3>
                <button class="white-small-button"><h4>See more</h4></button>
            </div>
        </div>

        <main>
            <c:if test="${sessionScope.role == 'employee' }">
            <p style="font-size: larger">This is what you can do,
                since your are logged in as an employee</p>
            <p><a href="fc/employeepage">Employee Page</a>
                </c:if>

                <c:if test="${sessionScope.role == 'customer' }">
            <p style="font-size: larger">This is what you can do, since your
                are logged in as a customer</p>
            <p><a href="fc/customerpage">Customer Page</a>
                </c:if>
        </main>
    </jsp:body>
</t:genericpage>