<%-- 
    Document   : viewTimeSlots
    Created on : Jun 13, 2016, 9:35:54 AM
    Author     : Chandu Herath
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="Model.TimeSlot"%>
<%@page import="Controller.DBDataList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="stylesAndScripts.jsp" %>
    </head>
    <body>
        <div>
            <%@include file="header.jsp" %>
        </div>
        <div class="col-md-offset-3 col-md-6">
            <%                int docID = Integer.parseInt(request.getParameter("docID"));
                DBDataList dl = new DBDataList();
                ArrayList<TimeSlot> timeslotArray = dl.getMyTimeSlots(docID);
                if (!(timeslotArray == null || timeslotArray.size() == 0)) {
            %>
            <div class="col-md-12" style="background-color: white;margin-bottom: 40px;margin-top: 80px;border-style: solid;border-right: none;border-top: none;border-bottom: none;border-left-color: #286090" >
                <h2 style="font-family: cursive;text-align: center">Select a Time Slot</h2>
            </div>

            <div class="col-md-12" style="border-style: solid;background-color: white;border-right: none;border-top: none;border-bottom: none;border-left-color: #286090" >
                <div style="margin-left: 30px;margin-top: 30px">
                    <table class="table table-hover">
                        <thead>
                            <tr>
                                <th></th>
                                <th>Start Time</th>
                                <th>End Time</th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                for (int i = 0; i < timeslotArray.size(); i++) {
                            %>
                            <tr>
                                <td><%= timeslotArray.get(i).getOndate()%></td>
                                <td><%= timeslotArray.get(i).getStartTime()%></td>
                                <td><%= timeslotArray.get(i).getEndTime()%></td>
                                <td><a href="registerToTimeSlot.jsp?timeslotID=<%= timeslotArray.get(i).getTimeslot_id()%>" class="btn btn-danger">Book</a></td>
                            </tr>
                            <%
                                }
                            %>
                        </tbody>
                    </table>
                </div>
            </div>
            <%
            } else {
            %>
            <div class="alert" style="background-color: #f8565b">
                <strong>Sorry!</strong> No Search Results For That Input.
            </div>


            <%
                }
            %>
        </div>
        <div class="col-sm-12">
            <%@include file = "footer.jsp" %>
        </div>
    </body>
</html>
