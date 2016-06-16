<%-- 
    Document   : viewDoctors
    Created on : May 30, 2016, 10:47:56 PM
    Author     : Chandu Herath
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="Model.Doctor"%>
<%@page import="Controller.DBDataList"%>
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
                                    <th>USER ID</th>
                                    <th>FIRST NAME</th>
                                    <th>LAST NAME</th>
                                    <th>NIC</th>
                                    <th>ADDRESS</th>
                                    <th>EMAIL</th>
                                    <th>FIELD</th>
                                    <th>WORKING HOSPITAL</th>
                            </thead>
                            <tbody>
                                <%                                    
                                    DBDataList dl = new DBDataList();
                                    ArrayList<Doctor> doclist = dl.getDoctorsList();
                                    if (doclist != null) {
                                        for (int i = 0; i < doclist.size(); i++) {
                                %>
                                <tr>
                                    <td><%= doclist.get(i).getUserId()%></td>
                                    <td><%= doclist.get(i).getFname()%></td>
                                    <td><%= doclist.get(i).getLname()%></td>
                                    <td><%= doclist.get(i).getNic()%></td>
                                    <td><%= doclist.get(i).getAddress()%></td>
                                    <td><%= doclist.get(i).getEmail()%></td>
                                    <td><%= doclist.get(i).getField()%></td>
                                    <td><%= doclist.get(i).getHospital()%></td>
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
