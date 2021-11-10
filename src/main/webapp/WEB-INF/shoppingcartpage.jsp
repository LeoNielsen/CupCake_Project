<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<t:genericpage>
    <jsp:attribute name="header">
         Login page
    </jsp:attribute>

    <jsp:attribute name="footer">
    </jsp:attribute>

    <jsp:body>
    <div class="center-container">
        <div class="shopping-cart-container">
            <div class="shopping-cart-section">
                <div class="top-grid-element">
                    <div class="left-grid">
                        <h2>Shopping cart</h2>
                    </div>
                    <div class="right-grid">
                        <h2>## Items</h2>
                    </div>
                </div>
                <c:if test="${sessionScope.cartlist == null}">
                    <div class="title-container">Your cart is empty</div>
                </c:if>
                <c:if test="${sessionScope.cartlist != null}">
                    <table class="center-grid-element">
                        <tr class="table-labels">
                            <th>PRODUCT DETAILS</th>
                            <th>QUANTITY</th>
                            <th>COST</th>
                            <th>TOTAL</th>
                            <th></th>
                        </tr>

                        <c:forEach items="${sessionScope.cartlist}" var="cupcake">
                            <tr>
                                <th>
                                    <div class="left-grid">
                                        <h4>cupcake</h4>
                                        <h5>with #### topping</h5>
                                    </div>
                                </th>
                                <th><h4>##</h4></th>
                                <th><h4>##</h4></th>
                                <th><h4>##</h4></th>
                                <th><button class="remove-button"><i class="fas fa-remove"></i></button></th>
                            </tr>
                        </c:forEach>
                    </table>
                </c:if>

                <div class="bottom-section">
                    <div class="left-grid">
                        <a class="purple-small-link-button" href="">Go back to menu</a>
                    </div>
                </div>
            </div>
            <div class="order-cart-section">
                <h2>Order summary</h2>
            </div>
        </div>
    </div>
    </jsp:body>
</t:genericpage>
