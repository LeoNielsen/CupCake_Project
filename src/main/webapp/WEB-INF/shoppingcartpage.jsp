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
                            <h2>${sessionScope.cart.cupcakes.size()} Items</h2>
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

                            <c:forEach items="${sessionScope.cart.cupcakes}" var="cupcake">
                                <tr>
                                    <th>
                                        <div class="left-grid">
                                            <h4>${cupcake.topping.name} cupcake</h4>
                                            <h5>with ${cupcake.bottom.name} topping</h5>
                                        </div>
                                    </th>
                                    <th><h4>${cupcake.quantity}</h4></th>
                                    <th><h4>${cupcake.price}</h4></th>
                                    <th><h4>${cupcake.total}</h4></th>
                                    <th>
                                        <button class="remove-button"><i class="fas fa-remove"></i></button>
                                    </th>
                                </tr>
                            </c:forEach>
                        </table>
                    </c:if>

                    <div class="bottom-section">
                        <div class="left-grid">
                            <a class="purple-small-link-button" href="${pageContext.request.contextPath}/fc/shopcupcakepage">Go back to menu</a>
                        </div>
                    </div>
                </div>
                <div class="order-cart-section">
                    <div class="title-container">
                        <h2>Order summary</h2>
                    </div>
                    <div style="color: white; display: inline">
                        <h3>TOTAL:</h3>
                        <c:if test="${sessionScope.cart != null}">
                            <h3>${sessionScope.cart.total} kr.</h3>
                        </c:if>
                        <c:if test="${sessionScope.cart == null}">
                            <h3>0.00 kr.</h3>
                        </c:if>
                    </div>

                    <form action="${pageContext.request.contextPath}/fc/paymentcommand" method="post">
                        <input class="purple-large-input-submit" type="submit" value="Make order">
                    </form>

                </div>
            </div>
        </div>
    </jsp:body>
</t:genericpage>
