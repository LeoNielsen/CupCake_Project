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
                            <h1>Shopping cart</h1>
                        </div>
                        <div class="right-grid">
                            <c:if test="${sessionScope.cart == null}">
                                <h2>0 Items</h2>
                            </c:if>
                            <c:if test="${sessionScope.cart != null}">
                                <h2>${sessionScope.cart.cupcakes.size()} Items</h2>
                            </c:if>
                        </div>
                    </div>
                    <c:if test="${sessionScope.cartlist == null || sessionScope.cartlist.size() == 0}">
                        <div class="center-grid-element">
                            <div class="center-text" style="padding: 50px">
                                <h4 style="font-weight: normal">Your cart is empty</h4>
                            </div>
                        </div>
                    </c:if>
                    <c:if test="${sessionScope.cartlist != null && sessionScope.cartlist.size() != 0}">
                        <div class="center-grid-element">
                            <table class="collapse-table">
                                <tr class="table-labels">
                                    <th class="left-text">PRODUCT DETAILS</th>
                                    <th>QUANTITY</th>
                                    <th>COST</th>
                                    <th>TOTAL</th>
                                    <th></th>
                                </tr>
                                <c:set var="number" value="-1"></c:set>
                                <c:forEach items="${sessionScope.cartlist}" var="cupcake">
                                    <tr>
                                        <th>
                                            <div class="left-grid">
                                                <h3>${cupcake.topping.name} cupcake</h3>
                                                <h4>with ${cupcake.bottom.name} topping</h4>
                                            </div>
                                        </th>
                                        <th><h3>${cupcake.quantity}</h3></th>
                                        <th><h3>${cupcake.price}</h3></th>
                                        <th><h3>${cupcake.total}</h3></th>
                                        <th>
                                            <form action="${pageContext.request.contextPath}/fc/removefromcartcommand"
                                                  method="post">
                                                <input type="hidden" name="cupcake" value="${number + 1}">
                                                <button class="remove-button"><i class="fas fa-remove"></i></button>
                                            </form>
                                        </th>
                                    </tr>
                                </c:forEach>
                            </table>
                        </div>

                    </c:if>

                    <div class="bottom-section">
                        <div class="left-grid">
                            <a class="purple-small-button" href="${pageContext.request.contextPath}/fc/cupcakecommand">Go
                                back to menu</a>
                        </div>
                    </div>
                </div>
                <form action="${pageContext.request.contextPath}/fc/paymentcommand" method="post">
                    <div class="order-cart-section" style="max-height: 500px">
                        <div class="title-container">
                            <h1>Order summary</h1>
                        </div>
                        <div class="white-text">
                            <div class="row-2-grid">
                                <div>
                                    <h4>TOTAL:</h4>
                                    <c:if test="${sessionScope.cart != null}">
                                        <h2>${sessionScope.cart.total} kr.</h2>
                                    </c:if>
                                    <c:if test="${sessionScope.cart == null}">
                                        <h2>0.00 kr.</h2>
                                    </c:if>
                                </div>
                                <div style="padding-top: 50px">
                                    <input class="green-large-button" type="submit" value="Make order">
                                </div>
                            </div>

                        </div>
                    </div>

                </form>
            </div>
        </div>
    </jsp:body>
</t:genericpage>
