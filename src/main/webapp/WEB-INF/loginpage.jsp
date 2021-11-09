<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<t:genericpage>
    <jsp:attribute name="header">
         Login page
    </jsp:attribute>

    <jsp:attribute name="footer">
    </jsp:attribute>

    <jsp:body>
        <!-- LOGIN -->
        <div class="large-container">
            <div class="login-container">
                <h1>Log in</h1>

                <form name="login" action="${pageContext.request.contextPath}/fc/logincommand" method="post">
                    <div class="text-input-container">
                        <div class="text-input-element">
                            <label for="email">Enter email:</label><br>
                            <input type="text" id="email" name="email" placeholder="Enter your email..."><br>
                        </div>
                        <div class="text-input-element">
                            <label for="password">Enter password:</label><br>
                            <input type="password" id="password" name="password" placeholder="Enter your password..."><br>
                            <a class="blue-link">Forgot password?</a>
                        </div>
                    </div>
                    <div class="clickable-input-container">
                        <input class="purple-large-input-submit" type="submit" value="Login"><br>
<%--                        <input class="green-large-input-submit" type="submit" value="Create new profile"><br>--%>
                    </div>

                </form>
            </div>
        </div>

    </jsp:body>
</t:genericpage>
