<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<t:genericpage>
    <jsp:attribute name="header">
         Customers
    </jsp:attribute>
    <jsp:attribute name="footer">
    </jsp:attribute>

    <jsp:body>
        <div class="grey-large-container">
            <div class="white-large-box">
                <div class="row-3-grid" style="gap: 20px">
                    <div class="large-title-grid-element">
                        <div class="left-text">
                            <h1>Customers</h1>
                        </div>
                    </div>
                    <div class="col-3-grid">
                        <div class="left-grid">
                            <h2>Customers</h2>
                        </div>
                        <div class="right-grid">
                            <h3>1 Total</h3>
                        </div>
                    </div>
                    <div>
                        <table class="collapse-table">
                            <tr class="table-labels">
                                <th class="left-text">CUSTOMER</th>
                                <th>FIRST NAME</th>
                                <th>LAST NAME</th>
                                <th>Phone</th>
                                <th>Address</th>
                                <th>ORDER TOTAL</th>
                                <th></th>
                            </tr>
                            <tr>
                                <th class="left-text"><h3>snap@gmail.com</h3></th>
                                <th><h3>Serverus</h3></th>
                                <th><h3>Snape</h3></th>
                                <th><h3>11223344</h3></th>
                                <th><h3>Hogwarts, Tårnværelse 501</h3></th>
                                <th><h3>51</h3></th>
                                <th><a class="purple-button" href="${pageContext.request.contextPath}/fc/customerdetailspage" style="padding: 10px 5px">See more</a></th>
                            </tr>
                            <tr>
                                <th class="left-text"><h3>snap@gmail.com</h3></th>
                                <th><h3>Serverus</h3></th>
                                <th><h3>Snape</h3></th>
                                <th><h3>11223344</h3></th>
                                <th><h3>Hogwarts, Tårnværelse 501</h3></th>
                                <th><h3>51</h3></th>
                                <th><a class="purple-button" href="${pageContext.request.contextPath}/fc/customerdetailspage" style="padding: 10px 5px">See more</a></th>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </jsp:body>

</t:genericpage>

