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
                                <img src="${pageContext.request.contextPath}/images/cupcake/topping/chocolate.png"
                                     style="position: relative; height: auto; width: 100%; display: block">
                                <img src="${pageContext.request.contextPath}/images/cupcake/bottom/chocolate.png"
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
                                            <h1 style="font-weight: normal">Bottom cupcake</h1>
                                            <h2 style="font-weight: normal">with topping</h2>
                                        </div>
                                        <div class="row-2-grid" style="gap: 5px">
                                            <div>
                                                <h3 style="font-weight: normal">Topping: 5 kr.</h3>
                                            </div>
                                            <div>
                                                <h3 style="font-weight: normal">Bottom: 5 kr.</h3>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="row-2-grid" style="gap: 20px">
                                    <div class="col-2-grid" style="gap: 20px">
                                        <div>
                                            <label for="topping">Choose topping</label>
                                            <select name="topping" id="topping">
                                                <c:forEach var="topping" items="${sessionScope.toppings}">
                                                    <option value="${topping}">${topping}</option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                        <div>
                                            <label for="bottom">Choose bottom</label>
                                            <select name="bottom" id="bottom">
                                                <c:forEach var="bottom" items="${sessionScope.bottoms}">
                                                    <option value="${bottom}">${bottom}</option>
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
                                        <a class="purple-no-fill-button" href="${pageContext.request.contextPath}/fc/shoppingcartpage">Go to cart <i
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

    </jsp:body>
</t:genericpage>
