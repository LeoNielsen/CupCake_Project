<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<t:genericpage>
    <jsp:attribute name="header">
         Homepage
    </jsp:attribute>
    <jsp:attribute name="footer">
    </jsp:attribute>

    <jsp:body>
        <!-- IMAGE BANNER -->
        <div class="img-container" style="background-image: url('${pageContext.request.contextPath}images/img.png')">
            <div class="large-container">
                <div class="section">
                    <div class="white-text">
                        <div class="left-text">
                            <div class="small-title-p">
                                <label class="title-label">Welcome to ${sessionScope.user.email}</label>
                            </div>
                            <div>
                                <label class="text-label">Lorem ipsum dolor sit amet, consectetur adipiscing elit.
                                    Etiam semper diam at erat
                                    pulvinar, at pulvinar felis blandit. Vestibulum volutpat tellus diam, consequat
                                    gravida libero
                                    rhoncus</label>
                            </div>
                        </div>
                    </div>
                    <div class="top-p">
                        <a class="white-small-button" href="${pageContext.request.contextPath}/fc/orderpage"><h4>See
                            more</h4></a>
                    </div>
                </div>

            </div>
        </div>
    </jsp:body>

</t:genericpage>

