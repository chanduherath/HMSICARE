<%-- 
    Document   : viewBookings
    Created on : Jun 16, 2016, 6:11:28 AM
    Author     : Chandu Herath
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="Model.Booking"%>
<%@page import="Controller.DBDataList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>HMSICARE</title
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
                        <table class="table table-bordered table-striped">
                            <thead>
                                <tr>
                                    <th>DATE</th>
                                    <th>START TIME</th>
                                    <th>END TIME</th>
                                    <th>STATUS</th>
                                    <th>NAME</th>
                                    <th>TELEPHONE</th>
                                    <th>EMAIL</th>
                                    <th>WORKING HOSPITAL</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    DBDataList dl = new DBDataList();
                                    ArrayList<Booking> bookinglist = dl.getBookings();
                                    if (bookinglist != null) {
                                        for (int i = 0; i < bookinglist.size(); i++) {
                                %>
                                <tr>
                                    <td><%= bookinglist.get(i).getDateOn() %></td>
                                    <td><%= bookinglist.get(i).getTimefrom() %></td>
                                    <td><%= bookinglist.get(i).getTimeto() %></td>
                                    <td><%= bookinglist.get(i).getStstus() %></td>
                                    <td><%= bookinglist.get(i).getPatientName() %></td>
                                    <td><%= bookinglist.get(i).getTelephone() %></td>
                                    <td><%= bookinglist.get(i).getEmail() %></td>
                                    <td><%= bookinglist.get(i).getDocName() %></td>
                                </tr>
                                <%
                                        }
                                    }
                                %>
                            </tbody>
                        </table>
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
