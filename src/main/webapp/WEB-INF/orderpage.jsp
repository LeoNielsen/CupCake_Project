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
        <div class="grey-large-container">
            <div class="large-section">
                <div class="row-1-grid">
                    <div class="white-box">
                        <div class="row-2-grid">
                            <div class="box-content">
                                <div class="l-bottom-p">
                                    <div class="title-p">
                                        <div class="center-text">
                                            <h1>Your orders</h1>
                                        </div>
                                    </div>
                                </div>
                                <div class="center-flex"> <!--TODO: ressionscop, foreach..-->
                                    <table>
                                        <tr class="table-labels">
                                            <th>ORDER</th>
                                            <th>PRODUCT DETAILS</th>
                                            <th>QUANTITY</th>
                                            <th>PRICE</th>
                                            <th>TOTAL</th>
                                            <th>DATE</th>
                                            <th>STATUS</th>
                                        </tr>
                                        <c:forEach var="order" items="${sessionScope.orderlist}">
                                            <c:forEach var="cupcake" items="${order.cupcakes}">
                                                <tr>
                                                    <th>${order.id}</th>
                                                    <th>
                                                        <h4>${cupcake.bottom.name} cupcake</h4>
                                                        <h5>with ${cupcake.topping.name} topping</h5>
                                                    </th>
                                                    <th>${cupcake.quantity}</th>
                                                    <th>${cupcake.price} kr</th>
                                                    <th>${cupcake.total} kr</th>
                                                    <th>${order.orderDate}</th>
                                                    <th>${order.status}</th>
                                                </tr>
                                            </c:forEach>
                                        </c:forEach>

                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </jsp:body>
</t:genericpage>
