<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<t:genericpage>
    <jsp:attribute name="header">
         Register as new User
    </jsp:attribute>
    <jsp:attribute name="footer">
    </jsp:attribute>
    <jsp:body>

        <div class="center-container">
            <div class="register-container">
                <div><h1>Create account</h1></div>
                <form>
                    <div>
                        <div class="col2-grid">
                            <div>
                                <label for="fname">First name</label><br>
                                <input type="text" id="fname" name="fname" placeholder="Enter your first name ..."><br>
                            </div>
                            <div>
                                <label for="lname">Last name</label><br>
                                <input type="text" id="lname" name="lname" placeholder="Enter your first name ..."><br>
                            </div>
                        </div>
                        <div>
                            <label for="email">Enter email:</label><br>
                            <input type="text" id="email" name="email" placeholder="Enter your email ..."><br>
                        </div>
                    </div>

                    <div>
                        <label for="password">Enter password:</label><br>
                        <input type="password" id="password" name="password"
                               placeholder="Enter your password ..."><br>
                        <label for="password1">Enter password again:</label><br>
                        <input type="password" id="password1" name="password1"
                               placeholder="Enter your password again ..."><br>
                    </div>
                    <div>
                        <label for="phonenumber">Enter your phonenumber:</label><br>
                        <input type="text" id="phonenumber" name="phonenumber" placeholder="Enter phonenumber ..."><br>
                    </div>

                    <div>
                        <div class="col2-grid">
                            <label for="streetname">Enter your street:</label><br>
                            <input type="text" id="streetname" name="streetname" placeholder="Enter street ..."><br>

                            <label for="housenumber">Enter your housenumber:</label><br>
                            <input type="text" id="housenumber" name="housenumber"
                                   placeholder="Enter housenumber ..."><br>
                        </div>
                    </div>
                    <div>
                        <label for="zipcode">Enter zipcode:</label><br>
                        <input type="text" id="zipcode" name="zipcode" placeholder="Enter ..."><br>
                    </div>
                    <div>
                        <label for="city">Enter city:</label><br>
                        <input type="text" id="city" name="city" placeholder="Enter city ..."><br>
                    </div>


                    <div>
                        <input class="purple-large-input-submit" type="submit" value="Create">
                    </div>
                </form>

            </div>

        </div>

    </jsp:body>
</t:genericpage>


