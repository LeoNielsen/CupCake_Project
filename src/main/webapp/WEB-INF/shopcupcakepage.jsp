<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<t:genericpage>
    <jsp:attribute name="header">
         Find us
    </jsp:attribute>

    <jsp:attribute name="footer">
    </jsp:attribute>
    <jsp:body>
        <div class="grey-large-container">
            <div class="white-large-box" style="width: 70%">
                <div class="title-grid-element">
                    <div class="left-text">
                        <h1>Shop cupcake</h1>
                    </div>
                </div>
                <div class="col-2-grid" style="box-sizing: border-box; gap: 50px; width: 100%">
                    <div style="box-sizing: border-box; width: 100%; padding: 25px">
                        <div class="center-flex" style="background-color: #E5E0EA">

                            <div class="row-2-grid"
                                 style="min-width: 200px; max-width: 300px; width: 50%; padding: 30px">
                                <img id="toppingimg"
                                     src="${pageContext.request.contextPath}/images/cupcake/topping/chocolate.png"
                                     style="position: relative; height: auto; width: 100%; display: block">
                                <img id="bottomimg"
                                     src="${pageContext.request.contextPath}/images/cupcake/bottom/chocolate.png"
                                     style="position: relative; height: auto; width: 100%; display: block">
                            </div>
                        </div>
                    </div>

                    <div style="box-sizing: border-box; width: 100%">
                        <form action="${pageContext.request.contextPath}/fc/shopcupcakecommand" method="post">
                            <div class="row-3-grid">
                                <div class="left-text">
                                    <div class="row-2-grid" style="padding-bottom: 25px">
                                        <div class="title-grid-element" style="padding-top: 0; padding-bottom: 25px">
                                            <h1 id="bottomtitle" style="font-weight: normal">Chocolate cupcake</h1>
                                            <h2 id="toppingtitle" style="font-weight: normal">with chocolate
                                                topping</h2>
                                        </div>
                                        <!--
                                        <div class="row-2-grid" style="gap: 5px">
                                            <div>
                                                <h3 style="font-weight: normal">Topping: 5 kr.</h3>
                                            </div>
                                            <div>
                                                <h3 style="font-weight: normal">Bottom: 5 kr.</h3>
                                            </div>
                                        </div>-->
                                    </div>
                                </div>

                                <div class="row-2-grid" style="gap: 20px">
                                    <div class="col-2-grid" style="gap: 20px">
                                        <div>
                                            <label for="topping">Choose topping</label>
                                            <select name="topping" id="topping" onchange="changeTopping()" on>
                                                <c:forEach var="topping" items="${applicationScope.toppings}">
                                                    <c:if test="${topping.name.equals('chocolate')}">
                                                        <option value="${topping.name}"
                                                                selected>${topping.name} ${topping.price} kr.
                                                        </option>
                                                    </c:if>
                                                    <c:if test="${!topping.name.equals('chocolate')}">
                                                        <option value="${topping.name}">${topping.name} ${topping.price}
                                                            kr.
                                                        </option>
                                                    </c:if>
                                                </c:forEach>
                                            </select>
                                        </div>
                                        <div>
                                            <label for="bottom">Choose bottom</label>
                                            <select name="bottom" id="bottom" onchange="changeBottom()">
                                                <c:forEach var="bottom" items="${applicationScope.bottoms}">
                                                    <c:if test="${bottom.name.equals('chocolate')}">
                                                        <option value="${bottom.name}"
                                                                selected>${bottom.name} ${bottom.price}
                                                            kr.
                                                        </option>
                                                    </c:if>
                                                    <c:if test="${!bottom.name.equals('chocolate')}">
                                                        <option value="${bottom.name}">${bottom.name} ${bottom.price}
                                                            kr.
                                                        </option>
                                                    </c:if>
                                                </c:forEach>
                                            </select>
                                        </div>
                                    </div>
                                    <div>
                                        <label for="quantity">Quantity</label>
                                        <input class="border-input-text" style="max-width: 100px" type="number"
                                               id="quantity" name="quantity"
                                               min="1" max="20" value="1">
                                    </div>
                                </div>
                                <div style="padding-top: 50px">
                                    <div class="row-2-grid" style="gap: 10px">
                                        <input class="green-large-button" type="submit" value="Add to cart">
                                        <a class="purple-no-fill-button"
                                           href="${pageContext.request.contextPath}/fc/shoppingcartpage">Go to cart <i
                                                class="fas">&#xf061;</i></a>
                                    </div>

                                </div>
                            </div>
                        </form>
                    </div>

                </div>
                <div style="width: 200px; padding-top: 25px">
                    <a class="purple-no-fill-button" href="${pageContext.request.contextPath}"><i
                            class="fas">&#xf060;</i>
                        Go back to home</a>
                </div>
            </div>
        </div>
        <script>
            function changeTopping() {
                var t = document.getElementById("topping").value;
                document.getElementById("toppingimg").src = "${pageContext.request.contextPath}/images/cupcake/topping/" + t + ".png";
                document.getElementById("toppingtitle").innerText = "with " + t + " topping";
            }

            function changeBottom() {
                var b = document.getElementById("bottom").value;
                document.getElementById("bottomimg").src = "${pageContext.request.contextPath}/images/cupcake/bottom/" + b + ".png";
                var capitalb = b.charAt(0).toUpperCase() + b.slice(1);
                document.getElementById("bottomtitle").innerText = capitalb + " cupcake";
            }
        </script>
    </jsp:body>
</t:genericpage>
