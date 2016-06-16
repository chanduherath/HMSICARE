<%-- 
    Document   : createReport
    Created on : Jun 12, 2016, 12:55:04 PM
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
        <%
            if (session.getAttribute("user") != null) {
                int userID = Integer.parseInt(request.getParameter("patientUserID"));
        %>
        <div id="wrapper" >
            <%@include file="sidebarMenu.jsp" %>
            <!-- Page Content -->
            <div id="page-content-wrapper">
                <div class="container-fluid" >
                    <div class="row" style="margin-left: -35px;margin-right: -35px;margin-top: -20px">
                        <%@include file="header.jsp" %>
                    </div>
                    <div class="col-md-6 col-md-offset-3" style="border-style: solid;background-color: white;border-right: none;border-top: none;border-bottom: none;border-left-color: #286090;height: 550px" >
                        <div style="margin-top: 30px">
                            <div class="row">
                                <h3 class="col-md-12 " style="font-family: sans-serif;text-align: center">Select Report Type</h3>
                            </div>
                            <div class="list-group">
                                <a class="list-group-item" href="fullBloodCount.jsp?patientUserID=<%= userID%>" style="text-align: center">Full Blood Count</a>
                                <a class="list-group-item" href="lipidprofile.jsp?patientUserID=<%= userID%>" style="text-align: center">Lipid Profile</a>
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
