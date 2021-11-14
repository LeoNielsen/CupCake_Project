<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<t:genericpage>
    <jsp:attribute name="header">
         Find us
    </jsp:attribute>

    <jsp:attribute name="footer">
    </jsp:attribute>

    <jsp:body>
        <div class="center-container">
            <div class="shopping-cart-container">
                <div class="shopping-cart-section">
                    <div class="center-text">
                        <h1>Find us</h1>
                    </div>
                    <div>

                    </div>
                    <div class="bottom-section">
                        <div class="left-grid">
                            <a class="purple-small-button" href="${pageContext.request.contextPath}/fc/cupcakecommand">Go
                                back to menu</a>
                        </div>
                    </div>
                </div>
                <form action="${pageContext.request.contextPath}/fc/paymentcommand" method="post">
                    <div class="order-cart-section">
                        <div class="title-container">
                            <h1>Get in touch</h1>
                        </div>
                        <div class="white-text">
                            <div class="row-2-grid" style="gap: 5px">
                                <div>
                                    <label for="messagename">Name</label><br>
                                    <input class="border-input-text" type="text" id="messagename" name="messagename"
                                           placeholder="Write your name.."><br>
                                    <label for="messageemail">Email</label><br>
                                    <input class="border-input-text" type="text" id="messageemail" name="messaageemail"
                                           placeholder="Write your email.."><br>
                                    <label for="message-textarea">Message</label><br>
                                    <textarea class="border-input-text" id="message-textarea" name="messaage-textarea" style="min-height: 200px"
                                              placeholder="Write your message.."></textarea><br>
                                </div>
                                <div style="padding-top: 20px">
                                    <input class="green-large-button" type="submit" value="Send message">
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </jsp:body>
</t:genericpage>
