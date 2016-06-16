<%-- 
    Document   : viewLabAssistant
    Created on : May 30, 2016, 10:52:15 PM
    Author     : Chandu Herath
--%>

<%@page import="Model.LabAssistant"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Controller.DBDataList"%>
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
                        <table class="table table-bordered table-striped">
                            <thead>
                                <tr>
                                    <th>USER ID</th>
                                    <th>FIRST NAME</th>
                                    <th>LAST NAME</th>
                                    <th>NIC</th>
                                    <th>ADDRESS</th>
                                    <th>EMAIL</th>
                                    <th>TYPE</th>   
                                </tr>
                            </thead>
                            <tbody>
                                <%                    DBDataList dl = new DBDataList();
                                    ArrayList<LabAssistant> labassislist = dl.getLabAssistantList();
                                    if (labassislist != null) {
                                        for (int i = 0; i < labassislist.size(); i++) {
                                %>
                                <tr>
                                    <td><%= labassislist.get(i).getUserId()%></td>
                                    <td><%= labassislist.get(i).getFname()%></td>
                                    <td><%= labassislist.get(i).getLname()%></td>
                                    <td><%= labassislist.get(i).getNic()%></td>
                                    <td><%= labassislist.get(i).getAddress()%></td>
                                    <td><%= labassislist.get(i).getEmail()%></td>
                                    <td><%= labassislist.get(i).getType()%></td>
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
