<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<t:genericpage>
    <jsp:attribute name="header">
         Editing product
    </jsp:attribute>
    <jsp:attribute name="footer">
    </jsp:attribute>
    <jsp:body>
        <div class="grey-large-container">
            <div class="white-small-box">
                <div class="large-title-grid-element">
                    <div class="center-text">
                        <h1>Edit topping</h1>
                    </div>
                </div>
                <form>
                    <div class="row-3-grid" style="gap: 50px">
                        <div class="row-2-grid">
                            <div class="title-grid-element" style="padding-bottom: 15px">
                                <div class="left-text">
                                    <h2>Change current products</h2>
                                </div>
                            </div>
                            <div>
                                <table>
                                    <tr class="table-labels">
                                        <th class="left-text">Name</th>
                                        <th class="left-text">Price</th>
                                        <th></th>
                                    </tr>
                                    <tr>
                                        <th style="padding-right: 15px">
                                            <input class="border-input-text" type="text" value="name">
                                        </th>
                                        <th style="padding-right: 15px">
                                            <input class="border-input-text" type="number" value="10">
                                        </th>
                                        <th>
                                            <a class="green-large-button" style="font-weight: normal; min-width: 150px; padding: 10px 24px">Add</a>
                                        </th>
                                    </tr>
                                </table>
                            </div>
                        </div>
                        <div class="row-2-grid">
                            <div class="title-grid-element" style="padding-bottom: 15px">
                                <div class="left-text">
                                    <h2>Change current products</h2>
                                </div>
                            </div>
                            <div>
                                <table class="collapse-table">
                                    <tr class="table-labels">
                                        <th class="left-text">NAME</th>
                                        <th class="left-text">PRICE</th>
                                        <th></th>
                                    </tr>
                                    <tr>
                                        <th style="padding-right: 15px">
                                            <input class="border-input-text" type="text" value="name">
                                        </th>
                                        <th style="padding-right: 15px">
                                            <input class="border-input-text" type="number" value="10">
                                        </th>
                                        <th>
                                            <button class="remove-button"><i class="fas fa-remove"></i></button>
                                        </th>
                                    </tr>
                                </table>
                            </div>
                        </div>
                        <div style="padding-top: 35px">
                            <div class="col-2-grid" style="gap: 10px">
                                <a class="grey-large-button"
                                   href="${pageContext.request.contextPath}/fc/productpage">Cancel</a>
                                <input class="green-large-button" type="submit" value="Save changes  ✓">
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </jsp:body>
</t:genericpage>