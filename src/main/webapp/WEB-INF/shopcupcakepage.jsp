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
                                <label for="quantity">Quantity:</label>
                                <input type="number" id="quantity" name="quantity" min="1" max="20" value="1">
                            </div>
                            <div>
                                <label for="topping">Choose topping:</label>
                                <select name="topping" id="topping">
                                    <option value="chocolate">Chocolate</option>
                                    <option value="blueberry">Blueberry</option>
                                    <option value="raspberry">Raspberry</option>
                                    <option value="crispy">Crispy</option>
                                    <option value="strawberry">Strawberry</option>
                                    <option value="rum">Rum/Raisin</option>
                                    <option value="orange">Orange</option>
                                    <option value="lemon">Lemon</option>
                                    <option value="bluecheese">Blue cheese</option>
                                </select>


                                <label for="bottom">Choose bottom:</label>
                                <select name="bottom" id="bottom">
                                    <option value="chocolate">Chocolate</option>
                                    <option value="vanilla">Vanilla</option>
                                    <option value="nutmeg">Nutmeg</option>
                                    <option value="pistacio">Pistacio</option>
                                    <option value="almond">Almond</option>
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
