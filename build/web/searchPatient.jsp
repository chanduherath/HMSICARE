<%-- 
    Document   : searchPatient
    Created on : May 31, 2016, 10:00:24 AM
    Author     : Chandu Herath
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>HMSICARE</title>
        <%@include file="stylesAndScripts.jsp" %>
    </head>
    <body style="background-color: #e4ebeb">
        <%
            if (session.getAttribute("user") != null) {
        %>
        <div id="wrapper" >
            <%@include file="sidebarMenu.jsp" %>
            <!-- Page Content -->
            <div id="page-content-wrapper">
                <div class="container-fluid" >
                    <div class="row" style="margin-left: -35px;margin-right: -35px;margin-top: -20px">
                        <%@include file="header.jsp" %>
                    </div>
                    <div class="row">
                        <div class="col-md-6 col-md-offset-3" style="background-color: white;margin-bottom: 40px;margin-top: 20px;border-style: solid;border-right: none;border-top: none;border-bottom: none;border-left-color: #286090" >
                        <h2 style="font-family: cursive;text-align: center">Search for a patient</h2>
                    </div>

                    <div class="col-md-6 col-md-offset-3" style="border-style: solid;background-color: white;border-right: none;border-top: none;border-bottom: none;border-left-color: #286090" >
                        <div style="margin-left: 30px;margin-top: 30px">
                            <form class="form-horizontal" action="SearchP" method="POST" style="align-items: center">

                                <div class = "form-group col-sm-12">                   
                                    <select  name="searchby" class="form-control">
                                        <option class=""value="def" selected="" disabled="">Search By</option>
                                        <option value="name">Name</option>
                                        <option value="nic">NIC</option>
                                        <option value="regnumber" >Registration Number</option>             
                                    </select>
                                </div> 

                                <div class="form-group col-sm-12">     
                                    <input id = "searchval" name = "searchval" type = "text" class = "form-control" placeholder = "SEARCH VALUE" >
                                </div>                                            
                                <div class="form-group col-sm-12">
                                    <!--<div class="col-sm-offset-2 col-sm-10">-->
                                    <button type="submit" class="btn btn-primary  center-block">Search</button>
                                </div>                           
                            </form> 
                        </div>
                    </div>
                    </div>
                </div>
            </div>            <!-- /#page-content-wrapper -->
        </div>
        <% } else {
                response.sendRedirect("login.jsp");
            }
        %>

        <!-- Menu Toggle Script -->
        <script>
            $("#menu-toggle").click(function (e) {
                e.preventDefault();
                $("#wrapper").toggleClass("toggled");
            });
        </script>
    </body>
</html>
