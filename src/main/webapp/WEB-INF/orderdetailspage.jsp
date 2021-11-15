<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<t:genericpage>
    <jsp:attribute name="header">
         Order details
    </jsp:attribute>
    <jsp:attribute name="footer">
    </jsp:attribute>

    <jsp:body>
        <div class="grey-large-container">
            <div class="white-large-box">
                <div class="row-4-grid" style="gap: 10px">

                    <div class="col-2-grid">
                        <div class="large-title-grid-element">
                            <div class="left-text">
                                <h1>${sessionScope.seemoreorder.id}</h1>
                                <h3><i class="fas">&#xf328;</i> Order details</h3>
                            </div>
                        </div>
                        <div class="right-text">
                            <h2>Status</h2>
                            <h3>${sessionScope.seemoreorder.status}</h3>
                        </div>
                    </div>
                    <div>
                        <!--TODO: settings, search field-->
                    </div>
                    <div>
                        <div class="left-text">
                            <div class="title-grid-element">
                                <div class="col-3-grid">
                                    <div class="left-grid">
                                        <h2>Order items</h2>
                                    </div>
                                    <div class="right-grid">
                                        <h3>${sessionScope.seemoreorder.totalItems} Total</h3>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <table class="collapse-table">
                            <tr class="table-labels">
                                <th class="left-text">PRODUCT DETAILS</th>
                                <th>QUANTITY</th>
                                <th>PRICE</th>
                                <th>TOTAL</th>
                            </tr>

                            <c:forEach var="cupcake" items="${sessionScope.seemoreorder.cupcakes}">
                                <tr>
                                    <th class="left-text">
                                        <h3>${cupcake.bottom.name} cupcake</h3>
                                        <h4>with ${cupcake.topping.name} topping</h4>
                                    </th>
                                    <th><h3>${cupcake.quantity}</h3></th>
                                    <th><h3>${cupcake.price} kr</h3></th>
                                    <th><h3>${cupcake.total} kr</h3></th>
                                </tr>
                            </c:forEach>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </jsp:body>

</t:genericpage>


