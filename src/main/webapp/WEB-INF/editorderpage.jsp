<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<t:genericpage>
    <jsp:attribute name="header">
         Editing order
    </jsp:attribute>
    <jsp:attribute name="footer">
    </jsp:attribute>
    <jsp:body>
        <div class="grey-large-container">
            <div class="white-large-box">
                <div class="large-title-grid-element">
                    <div class="center-text">
                        <h1>Editing order</h1>
                    </div>
                </div>
                <form>
                    <div class="row-3-grid" style="gap: 50px">
                        <div class="row-2-grid">
                            <div>
                                <div class="title-grid-element" style="padding-bottom: 10px">
                                    <h3 style="font-weight: bold">Nr. ${sessionScope.seemoreorder.id}</h3>
                                </div>
                                <label style="font-weight: bold" for="status">Change status</label><br>
                                <select style="max-width: 200px" name="status" id="status">
                                    <!--TODO: håndtering af status?-->
                                    <c:forEach var="s" items="${sessionScope.}">
                                        <option value="${bottom}">${bottom}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                        <div class="row-2-grid">
                            <div class="title-grid-element" style="padding-bottom: 15px">
                                <div class="col-3-grid">
                                    <div class="left-grid">
                                        <h2>Change order items</h2>
                                    </div>
                                    <div class="right-grid">
                                        <h3>${sessionScope.seemoreorder.totalItems} Total</h3>
                                    </div>
                                </div>
                            </div>
                            <div>
                                <table class="collapse-table">
                                    <tr class="table-labels">
                                        <th class="left-text">TOPPING</th>
                                        <th class="left-text">BOTTOM</th>
                                        <th class="left-text">QUANTITY</th>
                                        <th class="left-text">COST</th>
                                        <th class="left-text">TOTAL</th>
                                        <th></th>
                                    </tr>
                                    <c:forEach var="cupcake" items="${sessionScope.seemoreorder.cupcakes}">
                                        <tr>
                                            <th style="padding-right: 15px">
                                                <select style="min-width: 250px" name="bottom" id="bottom">
                                                    <c:forEach var="bottom" items="${sessionScope.bottoms}">
                                                        <option value="${cupcake.bottom.name}">${cupcake.bottom.name}</option>
                                                    </c:forEach>
                                                </select>
                                            </th>
                                            <th style="padding-right: 15px">
                                                <select style="min-width: 250px" name="topping" id="topping">
                                                    <c:forEach var="topping" items="${sessionScope.toppings}">
                                                        <option value="${cupcake.topping.name}">${cupcake.topping.name}</option>
                                                    </c:forEach>
                                                </select>
                                            </th>
                                            <th style="padding-right: 15px">
                                                <input class="border-input-text" type="number" value="${cupcake.quantity}">
                                            </th>
                                            <th style="padding-right: 15px">
                                                <input class="border-input-text" type="number" value="${cupcake.price}">
                                            </th>
                                            <th style="padding-right: 15px">
                                                <input class="border-input-text" type="number" value="${cupcake.total}">
                                            </th>
                                            <th>
                                                <button class="remove-button"><i class="fas fa-remove"></i></button>
                                            </th>
                                        </tr>
                                    </c:forEach>

                                </table>
                            </div>
                        </div>
                        <div style="padding-top: 35px">
                            <div class="col-3-grid" style="gap: 10px">
                                <a class="grey-large-button"
                                   href="${pageContext.request.contextPath}/fc/orderdetailspage">Cancel</a>
                                <a class="red-large-button"
                                   href="${pageContext.request.contextPath}/fc/editprofilepage">Delete order<i
                                        style="font-size:15px; color: white; padding-left: 10px"
                                        class="far">&#xf2ed;</i></a>
                                <input class="green-large-button" value="Save changes ✓">
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </jsp:body>
</t:genericpage>