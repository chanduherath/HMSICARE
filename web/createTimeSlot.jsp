<%-- 
    Document   : createTimeSlot
    Created on : Jun 12, 2016, 8:48:58 PM
    Author     : Chandu Herath
--%>

<%@page import="Model.TimeSlot"%>
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
                        <%                          
                            Doctor doc =(Doctor) ses.getAttribute("user");                          
                            DBDataList dl = new DBDataList();
                        %>
                        <h3 style="text-align: center">Create Your available Time slots</h3>
                        <div class="box-body">
                            <form class="form-horizontal" method="POST" action="SaveTimeSlot">
                                <div class="box box-info">                   
                                    <div class="form-group">
                                        <label class="control-label col-md-3">Select Date</label>
                                        <div class="col-md-3"> 
                                            <input id="dateOn" name="dateOn" type="date" class="form-control" required="">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label col-md-3">Start Time</label>
                                        <div class="col-md-3">
                                            <input id="timefrom" name="timefrom" type="time" class="form-control" required="">
                                        </div>
                                        <label class="control-label col-md-2">End Time</label>
                                        <div class="col-md-3">
                                            <input id="timeto" name="timeto" type="time" class="form-control" required="">
                                        </div> 
                                    </div>
                                    <div class="form-group">
                                        <input type="number" hidden="" name="doc_id" value="<%= doc.getDoc_id() %>">
                                    </div>

                                </div>
                                <div class="box-footer">
                                    <div class="form-group">
                                        <button type="submit" class="btn btn-info col-md-offset-10">Save</button>
                                    </div>
                                </div>
                            </form>

                        </div>

                        <table class="table table-bordered table-striped">
                            <thead>
                                <tr>
                                    <th>Date</th>
                                    <th>Start Time</th>
                                    <th>End Time</th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    ArrayList<TimeSlot> timesltlist = dl.getMyTimeSlots(doc.getDoc_id());
                                    if (timesltlist != null) {
                                        System.out.println(timesltlist.size());
                                        for (int i = 0; i < timesltlist.size(); i++) {
                                %>
                                <tr>
                                    <td><%= timesltlist.get(i).getOndate()%></td>
                                    <td><%= timesltlist.get(i).getStartTime()%></td>
                                    <td><%= timesltlist.get(i).getEndTime()%></td>
                                    <td><a href="deleteTimeSlot?timeslot_id=<%= timesltlist.get(i).getTimeslot_id() %>" class="btn btn-warning">remove</a></td>
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
