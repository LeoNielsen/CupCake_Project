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
                    <c:if test="${sessionScope.cartlist == null}">
                        <div class="title-container">
                            <h4 style="font-weight: normal">Your cart is empty</h4>
                        </div>
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
                            <c:set var="number" value="-1"></c:set>
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
                                        <form action="${pageContext.request.contextPath}/fc/removefromcartcommand" method="post">
                                            <input type="hidden" name="cupcake" value="${number + 1}">
                                            <button class="remove-button"><i class="fas fa-remove"></i></button>
                                        </form>
                                    </th>
                                </tr>
                            </c:forEach>
                        </table>
                    </c:if>

                    <div class="bottom-section">
                        <div class="left-grid">
                            <a class="purple-small-button" href="${pageContext.request.contextPath}/fc/shopcupcakepage">Go
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
                            <div class="row-3-grid">
                                <div>
                                    <h4>TOTAL:</h4>
                                    <c:if test="${sessionScope.cart != null}">
                                        <h2>${sessionScope.cart.total} kr.</h2>
                                    </c:if>
                                    <c:if test="${sessionScope.cart == null}">
                                        <h2>0.00 kr.</h2>
                                    </c:if>
                                </div>
                                <div>
                                    <label style="font-weight: bold" for="paymentmethod">How would you like to pay?</label>
                                    <div style="padding-bottom: 2px">
                                    </div>
                                    <select name="paymentmethod" id="paymentmethod">
                                        <option value="">Pay now</option>
                                        <option value="">Pay in shop</option>
                                    </select>
                                </div>
                                <div style="padding-top: 20px">
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
