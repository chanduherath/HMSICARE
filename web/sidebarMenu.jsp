<%-- 
    Document   : sidebarMenu
    Created on : May 30, 2016, 1:14:45 PM
    Author     : Chandu Herath
--%>

<%@page import="Model.Patient"%>
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
        <%
            User usrside = (User) session.getAttribute("user");
        %>
        <div id="sidebar-wrapper">
            <ul class="sidebar-nav">
                <li class="sidebar-brand">
                    <a href="#" style="text-align: center"><%= usrside.getUserLevel().toUpperCase()%></a>
                </li>
                <li>
                    <a href="#"><img src="img/default-user.png" height="100" width="100" style="margin-left: 50px"></a>
                </li>
                <li>
                    <a href="viewProfile.jsp">View My Profile</a>
                </li>   
                <%
                    if (!(usrside.getUserLevel().equals("Patient"))) {
                %>
                <li>
                    <a href="searchPatient.jsp">Search Patient</a>
                </li>   
                <%
                    }
                %>
                <%
                    if (usrside.getUserLevel().equals("Doctor")) {
                %>
                <li>
                    <a href="createTimeSlot.jsp">Create Time-Slot</a>
                </li>
                <%
                    }
                %>
                <%
                    if (usrside.getUserLevel().equals("admin")) {
                %>
                <li>
                    <a href="addUser.jsp?msg=">Add New Users</a>
                </li>
                <%
                    }
                %>
                 <%
                    if (usrside.getUserLevel().equals("Patient")) {
                        Patient pts = (Patient) usrside;
                %>
                <li>
                    <a href="prescriptionList.jsp?patientID=<%= pts.getPatient_id() %>">View Medical History</a>
                </li>
                <li>
                    <a href="reportList.jsp?patientID=<%= pts.getPatient_id() %>">View Past Lab Reports</a>
                </li>
                <%
                    }
                %>
                <li>
                    <a href="viewDoctors.jsp">View Doctors List</a>
                </li>
                <li>
                    <a href="viewLabAssistant.jsp">View Lab Assistants List</a>
                </li>
                <li>
                    <a href="viewBookings.jsp">View Bookings</a>
                </li>
            </ul>
        </div>
    </body>
</html>
