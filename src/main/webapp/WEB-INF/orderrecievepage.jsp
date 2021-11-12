<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<t:genericpage>
    <jsp:attribute name="header">
         orderpage
    </jsp:attribute>

    <jsp:attribute name="footer">
    </jsp:attribute>

    <jsp:body>
        <div class="grey-large-container">
            <div class="white-medium-box">
                <div class="row-3-grid">
                    <div class="title-grid-element">
                        <div class="center-text">
                            <h1><i class="fas fa-check-circle"></i> We have recieved your order</h1>
                        </div>
                    </div>
                    <div class="mp-grid-element">
                        <div class="center-text">
                            <h4 style="font-weight: normal">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam semper diam at erat
                                pulvinar,
                                at pulvinar felis blandit. Vestibulum volutpat tellus diam, consequat gravida libero
                                rhoncus
                                ut.</h4>
                        </div>
                    </div>
                    <div class="mp-grid-element">
                        <div class="flex-box">
                            <a class="purple-button">See your order here</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </jsp:body>
</t:genericpage>