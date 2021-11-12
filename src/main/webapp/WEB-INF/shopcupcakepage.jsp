<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<t:genericpage>
    <jsp:attribute name="header">
         Shopping cupcakes
    </jsp:attribute>

    <jsp:attribute name="footer">
    </jsp:attribute>

    <jsp:body>
        <div class="large-container1">

            <div class="white-large-section">
                <div class="title-container">
                    <h1>Design your cupcake</h1>
                </div>
                <div class="col3-grid">

                    <div class="section1">
                        <div style="display: grid; grid-auto-rows: auto auto auto; gap: 0">
                            <div style="grid-column: 2; padding: 0; display: block">
                                <img src="${pageContext.request.contextPath}/images/cupcake/topping/${sessionScope.topping}.png"
                                     style="position: relative; height: auto; width: 150px; display: block">
                                <img src="${pageContext.request.contextPath}/images/cupcake/bottom/${sessionScope.botton}.png"
                                     style="position: relative; height: auto; width: 150px; display: block">
                            </div>
                        </div>
                        <div>
                            <a class="purple-small-button" href="${pageContext.request.contextPath}">Back
                                to home</a>
                        </div>
                    </div>
                    <div class="section2">
                        <form action="${pageContext.request.contextPath}/fc/shopcupcakecommand" method="post">
                            <div>
                                <label for="quantity">Quantity:</label>
                                <input class="border-input-text" type="number" id="quantity" name="quantity" min="1" max="20" value="1">
                            </div>
                            <div>
                                <label for="topping">Choose topping:</label>
                                <select name="topping" id="topping">
                                    <c:forEach var="topping" items="${sessionScope.toppings}">
                                            <option value="${topping}">${topping}</option>
                                    </c:forEach>
<%--                                    <option value="chocolate">Chocolate</option>--%>
<%--                                    <option value="blueberry">Blueberry</option>--%>
<%--                                    <option value="raspberry">Raspberry</option>--%>
<%--                                    <option value="crispy">Crispy</option>--%>
<%--                                    <option value="strawberry">Strawberry</option>--%>
<%--                                    <option value="rum">Rum/Raisin</option>--%>
<%--                                    <option value="orange">Orange</option>--%>
<%--                                    <option value="lemon">Lemon</option>--%>
<%--                                    <option value="bluecheese">Blue cheese</option>--%>
                                </select>


                                <label for="bottom">Choose bottom:</label>
                                <select name="bottom" id="bottom">
                                    <c:forEach var="bottom" items="${sessionScope.bottoms}">
                                        <option value="${bottom}">${bottom}</option>
                                    </c:forEach>
<%--                                    <option value="chocolate">Chocolate</option>--%>
<%--                                    <option value="vanilla">Vanilla</option>--%>
<%--                                    <option value="nutmeg">Nutmeg</option>--%>
<%--                                    <option value="pistacio">Pistacio</option>--%>
<%--                                    <option value="almond">Almond</option>--%>
                                </select>
                            </div>

                            <div style="padding-top: 20px">
                                <input class="purple-large-button" type="submit" value="Add to cart">
                            </div>
                        </form>
                    </div>
                </div>

            </div>

        </div>


    </jsp:body>
</t:genericpage>
