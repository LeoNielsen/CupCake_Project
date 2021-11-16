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
                <form action="${pageContext.request.contextPath}/fc/saveordercommand" method="post">
                    <div class="row-3-grid" style="gap: 50px">
                        <div class="row-2-grid">
                            <div>

                                <!---->
                                <div class="title-grid-element" style="padding-bottom: 10px">
                                    <div class="col-3-grid">
                                        <div class="left-grid">
                                            <h3 style="font-weight: bold">Nr. ${sessionScope.seemoreorder.id}</h3>
                                        </div>
                                        <div class="right-grid">
                                            <h3 style="font-weight: bold"> ${sessionScope.seemoreorder.user.email}</h3>
                                            <input type="hidden" name="userid" value="${sessionScope.seemoreorder.user.id}">
                                            <input type="hidden" name="id" value="${sessionScope.seemoreorder.id}">
                                        </div>
                                    </div>
                                    <!---->

                                </div>
                                <label style="font-weight: bold" for="status">Change status</label><br>
                                <select style="max-width: 200px" name="status" id="status">
                                    <!--TODO: håndtering af status?-->
<%--                                    <c:forEach var="status" items="${sessionScope.seemoreorder.status}">--%>
                                        <option value="${sessionScope.seemoreorder.status}" selected>${sessionScope.seemoreorder.status}</option>
                                        <option value="pending">pending</option>
                                        <option value="received">received</option>
                                        <option value="process">process</option>
                                        <option value="ready">ready</option>
                                        <option value="cancelled">cancelled</option>
                                        <option value="stopped">stopped</option>
<%--                                    </c:forEach>--%>
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
<%--                                    <c:forEach var="cupcake" items="${sessionScope.seemoreorder.cupcakes}">--%>
                                        <tr>
                                            <th style="padding-right: 15px">
                                                <select style="min-width: 250px" name="topping" id="topping">
                                                    <c:forEach var="topping" items="${applicationScope.toppings}">
                                                        <c:if test="${!sessionScope.editcupcake.topping.name.equals(topping.name)}">
                                                            <option value="${topping.name}">${topping.name}</option>
                                                        </c:if>
                                                        <c:if test="${sessionScope.editcupcake.topping.name.equals(topping.name)}">
                                                            <option value="${topping.name}"
                                                                    selected>${topping.name}</option>
                                                        </c:if>
                                                    </c:forEach>
                                                </select>
                                            </th>
                                            <th style="padding-right: 15px">
                                                <select style="min-width: 250px" name="bottom" id="bottom">
                                                    <c:forEach var="bottom" items="${applicationScope.bottoms}">
                                                        <c:if test="${!sessionScope.editcupcake.bottom.name.equals(bottom.name)}">
                                                            <option value="${bottom.name}">${bottom.name}</option>
                                                        </c:if>
                                                        <c:if test="${sessionScope.editcupcake.bottom.name.equals(bottom.name)}">
                                                            <option value="${bottom.name}"
                                                                    selected>${bottom.name}</option>
                                                        </c:if>
                                                    </c:forEach>
                                                </select>
                                            </th>
                                            <th style="padding-right: 15px">
                                                <input name="quantity" class="border-input-text" type="number"
                                                       value="${sessionScope.editcupcake.quantity}">
                                            </th>
                                            <th style="padding-right: 15px">
                                                <input class="border-input-text" type="number" name="total" value="${sessionScope.editcupcake.total}">
                                            </th>
                                            <th>
                                                <button class="remove-button"><i class="fas fa-remove"></i></button>
                                            </th>
                                        </tr>
<%--                                    </c:forEach>--%>

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
                                <input type="submit" class="green-large-button" value="Save changes ✓">
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </jsp:body>
</t:genericpage>