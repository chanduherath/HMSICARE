<%-- 
    Document   : header
    Created on : May 29, 2016, 9:32:44 PM
    Author     : Chandu Herath
--%>

<%@page import="Model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="stylesAndScripts.jsp" %>  
        
    </head>
    <body>
        <nav class="navbar navbar-inverse" style="border-radius: 0;">
            <div class="container-fluid">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span> 
                    </button>
                    <!--<a class="navbar-brand" href="index.jsp">SethSevana</a>-->
                    <a href="#menu-toggle" class="navbar-brand" id="menu-toggle" style="background-image: url(img/sethsevanaLogo.jpg);width: 130px;background-repeat: no-repeat" ></a>
                </div>
                <div class="collapse navbar-collapse" id="myNavbar">
                    <ul class="nav navbar-nav">
                        <!--<li class="active"><a href="index.jsp">Home</a></li>-->
                        <%
                            HttpSession ses = request.getSession();
                            if (null == ses.getAttribute("user")) {
//                                User us = (User) ses.getAttribute("user");
                        %> 
                        <li><a href="index.jsp">HOME</a></li>
                        <li><a href="makeBooking.jsp">ONLINE BOOKING</a></li>
                        <li><a href="aboutUs.jsp">ABOUT</a></li> 
                        <li><a href="contactUs.jsp">CONTACT</a></li> 
                            <%
                                }
                            %>

                    </ul>
                    <ul class="nav navbar-nav navbar-right">
                        <%
                            if ((null == ses.getAttribute("user"))) {
                        %>
                        <li><a href="login.jsp?msg=success"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
                            <%
                            } else {
                                User us = (User) ses.getAttribute("user");
                            %>
                        <!--<li><label class="center-block" style="color: whitesmoke"><%= us.getFname() + us.getLname()%></label>></li>-->
                        <li><a href="#"><%= us.getFname() + " " + us.getLname()%></a></li>
                        <li><a href="Signout"><span class="glyphicon glyphicon-log-out"></span> Logout</a></li>
                            <%
                                }
                            %> 
                    </ul>

                </div>
            </div>
        </nav>
    </body>
</html>
