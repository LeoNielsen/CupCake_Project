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
        <div class="large-container">

            <div class="white-large-section">
                <div class="title-container">
                    <h1>Design your cupcake</h1>
                </div>
                <div class="col3-grid">
                    <div class="section1">
                        <div style="display: grid; grid-auto-rows: auto auto auto; gap: 0">
                            <div>
                                <c:if test="${sessionScope.topping != null}">
                                    <h1>${sessionScope.topping}</h1>
                                </c:if>
                            </div>
                            <div style="grid-column: 2; padding: 0; display: block">
                                <img src="${pageContext.request.contextPath}/images/cupcake/topping/bluecheese.png"
                                     style="position: relative; height: auto; width: 150px; display: block">
                                <img src="${pageContext.request.contextPath}/images/cupcake/bottom/almond.png"
                                     style="position: relative; height: auto; width: 150px; display: block">
                            </div>
                        </div>
                        <div>
                            <a class="purple-small-link-button" href="${pageContext.request.contextPath}">Back
                                to home</a>
                        </div>
                    </div>
                    <div class="section2">
                        <form action="${pageContext.request.contextPath}/fc/shopcupcakecommand" method="post">
                            <div>
                                <label for="amount">Quantity:</label>
                                <input type="number" id="amount" name="amount" min="1" max="20" value="1">
                            </div>
                            <div>
                                <label for="topping">Choose topping:</label>
                                <select name="topping" id="topping">
                                    <option value="chocolate">Chocolate</option>
                                    <option value="">Blueberry</option>
                                    <option value="">Raspberry</option>
                                    <option value="">Crispy</option>
                                    <option value="">Strawberry</option>
                                    <option value="">Rum/Raisin</option>
                                    <option value="">Orange</option>
                                    <option value="">Lemon</option>
                                    <option value="">Blue cheese</option>
                                </select>


                                <label for="bottom">Choose bottom:</label>
                                <select name="bottom" id="bottom">
                                    <option value="">Chocolate</option>
                                    <option value="">Vanilla</option>
                                    <option value="">Nutmeg</option>
                                    <option value="">Pistacio</option>
                                    <option value="">Almond</option>
                                </select>
                            </div>

                            <div style="padding-top: 20px">
                                <input class="purple-large-input-submit" type="submit" value="Add to cart">
                            </div>
                        </form>
                    </div>
                </div>

            </div>

        </div>


    </jsp:body>
</t:genericpage>
