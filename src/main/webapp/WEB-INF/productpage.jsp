<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<t:genericpage>
    <jsp:attribute name="header">
         Product page
    </jsp:attribute>

    <jsp:attribute name="footer">
    </jsp:attribute>
    <jsp:body>
        <div class="grey-large-container">
            <div class="white-large-box">
                <div class="large-title-grid-element">
                    <div class="left-text">
                        <h1>Products <i class="fas fa-store"></i></h1>
                    </div>
                </div>
                <div class="col-2-grid" style="box-sizing: border-box; gap: 50px; width: 100%">
                    <div style="box-sizing: border-box; width: 100%; padding: 25px">
                        <div class="row-2-grid" style="gap: 10px">
                            <div class="title-grid-element">
                                <div class="left-text">
                                    <h2>Toppings <a class="red-button" href="${pageContext.request.contextPath}/fc/editproductpage"><i
                                            class="fas fa-edit"></i></a></h2>
                                </div>
                            </div>
                            <div>
                                <table class="collapse-table">
                                    <tr class="table-labels">
                                        <th class="left-text">Name</th>
                                        <th>Price</th>
                                    </tr>
                                    <c:forEach var="topping" items="${applicationScope.toppings}">
                                    <tr>
                                        <th class="left-text"><h3>${topping.name}</h3></th>
                                        <th><h3>${topping.price} kr.</h3></th>
                                    </tr>
                                    </c:forEach>
                                </table>
                            </div>

                        </div>
                    </div>
                    <div style="box-sizing: border-box; width: 100%; padding: 25px">
                        <div class="row-2-grid" style="gap: 10px">
                            <div class="title-grid-element">
                                <div class="left-text">
                                    <h2>Bottoms <a class="red-button"
                                                   href="${pageContext.request.contextPath}/fc/editproductpage"><i
                                            class="fas fa-edit"></i></a></h2>
                                </div>
                            </div>
                            <div>
                                <table class="collapse-table">
                                    <tr class="table-labels">
                                        <th class="left-text">Name</th>
                                        <th>Price</th>
                                    </tr>
                                    <c:forEach var="bottom" items="${applicationScope.bottoms}">
                                    <tr>
                                        <th class="left-text"><h3>${bottom.name}</h3></th>
                                        <th><h3>${bottom.price} kr.</h3></th>
                                    </tr>
                                    </c:forEach>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </jsp:body>
</t:genericpage>
