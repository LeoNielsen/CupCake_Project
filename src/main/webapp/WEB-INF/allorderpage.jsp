<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<t:genericpage>
    <jsp:attribute name="header">
         Orders
    </jsp:attribute>
    <jsp:attribute name="footer">
    </jsp:attribute>

    <jsp:body>
        <div class="grey-large-container">
            <div class="white-large-box">
                <div class="row-3-grid" style="gap: 20px">
                    <div class="large-title-grid-element">
                        <div class="left-text">
                            <h1>Orders</h1>
                        </div>
                    </div>

                    <div class="col-3-grid">
                        <div class="left-grid">
                            <h2>Orders</h2>
                        </div>
                        <div class="right-grid">
                            <h3>1 Total</h3>
                        </div>
                    </div>
                    <div>
                        <table class="collapse-table">
                            <tr class="table-labels">
                                <th class="left-text">ORDER</th>
                                <th>CUSTOMER</th>
                                <th>ITEMS</th>
                                <th>TOTAL</th>
                                <th>DATE</th>
                                <th>STATUS</th>
                                <th></th>
                            </tr>
                            <c:forEach var="order" items="${sessionScope.allorders}">

                                    <tr>
                                        <th class="left-text"><h3>${order.id}</h3></th>
                                        <th><h3>${order.user.email}</h3></th>
                                        <th><h3>${order.cupcakes.size()}</h3></th>
                                        <th><h3>${order.totalPrice} kr</h3></th>
                                        <th><h3>${order.orderDate}</h3></th>
                                        <th><h3>${order.status}</h3></th>
                                        <th><a class="purple-button"
                                               href="${pageContext.request.contextPath}/fc/orderdetailspage"
                                               style="padding: 10px 10px">See more</a></th>
                                    </tr>

                            </c:forEach>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </jsp:body>

</t:genericpage>

