<%-- 
    Document   : reportList
    Created on : Jun 12, 2016, 4:53:35 PM
    Author     : Chandu Herath
--%>

<%@page import="Model.LipidProfile"%>
<%@page import="Controller.SearchLabAssistant"%>
<%@page import="Controller.SearchReports"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Model.FullBloodCount"%>
<%@page import="Controller.SearchPatient"%>
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
                int patientID = Integer.parseInt(request.getParameter("patientID"));
                SearchPatient sp = new SearchPatient();
                SearchReports sr = new SearchReports();
                SearchLabAssistant sl = new SearchLabAssistant();
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
                        <h3 class="col-md-3"><b>Patient Name :</b></h3>
                        <h3 class="col-md-3"><%= sp.getPatientByPatientID(patientID).getFname() + " " + sp.getPatientByPatientID(patientID).getLname()%></h3>
                    </div>
                    
                    <div class="row">
                        <h3>Full Blood Count</h3>
                        <table class="table table-bordered table-striped">
                            <thead>
                                <tr>
                                    <th>ISSUED DATE</th>
                                    <th>ISSUED BY</th>
                                    <th>HAEMOGLOBIN</th>
                                    <th>PLATELET COUNT</th>
                                    <th></th>
                            </thead>
                            <tbody>
                                <%
                                    ArrayList<FullBloodCount> fullbloodcountlist = sr.getFullBloodCountListByPatientID(patientID);
                                    if (fullbloodcountlist != null) {
                                        for (int i = 0; i < fullbloodcountlist.size(); i++) {
                                %>
                                <tr>
                                    <td><%= fullbloodcountlist.get(i).getIssued_date() %></td>
                                    <td><%= sl.getLabAssistantByLabAssistantID(fullbloodcountlist.get(i).getLabassistant_id()).getFname() + " " + sl.getLabAssistantByLabAssistantID(fullbloodcountlist.get(i).getLabassistant_id()).getLname() %></td>                                   
                                    <td><%= fullbloodcountlist.get(i).getHaemoglobin() %></td>
                                    <td><%= fullbloodcountlist.get(i).getPlateletcount() %></td>   
                                    <td><a href="updateFullBloodCount.jsp?bloodcountID=<%= fullbloodcountlist.get(i).getBloodreport_id() %>" class="btn btn-info btn-sm">View</a></td>
                                </tr>
                                <%
                                        }
                                    }
                                %>
                            </tbody>
                        </table>                        
                    </div>
                    <div class="row">
                        <h3>Lipid Profile</h3>
                        <table class="table table-bordered table-striped">
                            <thead>
                                <tr>
                                    <th>ISSUED DATE</th>
                                    <th>ISSUED BY</th>
                                    <th>CHOLESTEROL TOTAL</th>
                                    <th>CHOLESTEROL/HDL RATIO</th>
                                    <th></th>
                            </thead>
                            <tbody>
                                <%
                                    ArrayList<LipidProfile> lipidprolist = sr.getLipidProfileByPatientID(patientID);
                                    if (lipidprolist != null) {
                                        for (int i = 0; i < lipidprolist.size(); i++) {
                                %>
                                <tr>
                                    <td><%= lipidprolist.get(i).getIssued_date() %></td>
                                    <td><%= sl.getLabAssistantByLabAssistantID(lipidprolist.get(i).getLabassistant_id()).getFname() + " " + sl.getLabAssistantByLabAssistantID(lipidprolist.get(i).getLabassistant_id()).getLname() %></td>                                   
                                    <td><%= lipidprolist.get(i).getCho_total() %></td>
                                    <td><%= lipidprolist.get(i).getRatio() %></td>
                                    <td><a href="updateLipidProfile.jsp?lipidprofileID=<%= lipidprolist.get(i).getLipid_profile_id() %>" class="btn btn-info btn-sm">View</a></td>
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
