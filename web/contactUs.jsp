<%-- 
    Document   : contactUs
    Created on : Jun 16, 2016, 8:28:54 AM
    Author     : Chandu Herath
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="stylesAndScripts.jsp" %>
    </head>
    <body style="background-color: #e4ebeb">
        <div>
            <%@include file="header.jsp" %>
        </div> 
        <div class="container">
            <div class="col-md-12">
                <h3 style="color: #3366ff"><b>Contact Us Us</b></h3>
            </div>
            <div class="row">
                <div class="col-md-3">
                    <h4><b>Address</b></h4>
                    <p>No. 152</p>
                    <p>Colombo Road</p>
                    <p>Kurunegala</p>
                    <p>Sri Lanka</p>
                </div>
                <div class="col-md-3">
                    <h4><b>Emergency 5191</b></h4>
                    <p><b>Tel</b> </p>
                    <p>+94717189255</p>
                    <p>+94372249645</p>
                    <p><b>Fax</b></p>
                    <p>+94711119440</p>
                </div>
                <div class="col-md-6">
                    <img class="col-md-12" src="img/contactUs.png" alt="contact us" >
                </div>
            </div>

        </div>
        <div class="col-sm-12">
            <%@include file = "footer.jsp" %>
        </div>
    </body>
</html>
