<%-- 
    Document   : payForBooking
    Created on : Jun 14, 2016, 7:20:36 PM
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
        <div class="col-md-offset-3 col-md-6" >
            <div class="col-md-12" style="border-style: solid;background-color: white;border-right: none;border-top: none;border-bottom: none;border-left-color: #286090" >
                <div style="margin-left: 30px;margin-top: 30px">
                    <%
                    %>
                    <form class="form-horizontal" action="https://www.sandbox.paypal.com/cgi-bin/webscr" method="POST" style="align-items: center">
                        <div class="form-group col-md-12">
                            <label class="col-md-4 control-label">PATIENT'S NAME</label>
                            <label class="control-label col-md-8" style="text-align: left"><%= request.getSession().getAttribute("spec") + " " + request.getSession().getAttribute("pname")%></label>
                        </div>
                        <div class="form-group col-md-12">
                            <label class="col-md-4 control-label">PHONE</label>                
                            <label class="control-label col-md-8" style="text-align: left"><%= request.getSession().getAttribute("telephone")%></label>
                        </div>
                        <div class="form-group col-md-12">
                            <label class="col-md-4 control-label">NIC</label>
                            <label class="control-label col-md-8" style="text-align: left"><%= request.getSession().getAttribute("nic")%></label>
                        </div>
                        <div class="form-group col-md-12">
                            <label class="col-md-4 control-label">EMAIL</label>
                            <label class="control-label col-md-8" style="text-align: left"><%= request.getSession().getAttribute("email")%></label>
                        </div>
                        <label class="control-label col-md-12" style="text-align: left;color: #cc2626">You have to pay the above amount in order to create the Booking. Money will not be returned due to any reason. After completing the  booking successfully it will get recorded in our database. </label>
                        <br>
                        <label class="control-label col-md-4">Payment Amount</label>
                        <label class="control-label col-md-8" style="text-align: left">$10</label>
                        <br>
                        <!--<input type="button" class="btn btn-info" onclick="window.location.href = 'login.jsp?name==1';" value="Click here">-->

                        <input type="hidden" name="business" value="seller93@gmail.com"><!--Your business account details-->        
                        <input type="hidden" name="cmd" value="_xclick">        
                        <input type="hidden" name="item_name" value="booking_price"><!--Buying item name-->
                        <input type="hidden" name="amount" value="10"><!--Buying item value-->
                        <input type="hidden" name="currency_code" value="USD">
                        <input type="hidden" name="return" value="http://localhost:8080/HMS-ICARE/SaveBooking"><!--Where to return to after successful transaction-->
                        <input type="hidden" name="rm" value="2">
                        <input type="hidden" name="cancel_return" value="http://localhost:8080/HMS-ICARE/paypalfail.jsp"> <!--Where to return to after cancelling a transaction-->
                        <div class="col-md-12">
                            <input type="image" name="submit"  src="https://www.paypal.com/en_US/i/btn/btn_buynow_LG.gif" alt="PayPal - The safer, easier way to pay online" class="center-block">
                            <br>
                        </div>
                        <img alt="" border="0" width="1" height="1" src="https://www.paypal.com/en_US/i/scr/pixel.gif" >

                        <!--                        <div class="form-group col-sm-12">
                                                    <div class="col-sm-offset-2 col-sm-10">
                                                    <button type="submit" class="btn btn-primary btn-lg center-block">Search</button>
                                                </div>-->
                    </form> 
                </div>
            </div>
        </div>       
        <div class="col-sm-12">
            <%@include file = "footer.jsp" %>
        </div>
    </body>
</html>
