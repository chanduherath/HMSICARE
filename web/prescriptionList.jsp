<%-- 
    Document   : prescriptionList
    Created on : Jun 6, 2016, 4:07:33 PM
    Author     : Chandu Herath
--%>

<%@page import="Controller.SearchPatient"%>
<%@page import="Controller.SearchDoctor"%>
<%@page import="Model.Prescription"%>
<%@page import="java.util.ArrayList"%>
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
                int patientID = Integer.parseInt(request.getParameter("patientID"));
                DBDataList dl = new DBDataList();
                SearchDoctor sd = new SearchDoctor();
                SearchPatient sp = new SearchPatient();
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
                        <table class="table table-bordered table-striped">
                            <thead>
                                <tr>
                                    <th>EXAMINED DATE</th>
                                    <th>EXAMINED BY</th>
                                    <th>DIAGNOSED WITH</th>
                                    <th></th>
                            </thead>
                            <tbody>
                                <%
                                    ArrayList<Prescription> preslist = dl.getPrescriptionListByPatientID(patientID);
                                    if (preslist != null) {
                                        for (int i = 0; i < preslist.size(); i++) {
                                %>
                                <tr>
                                    <td><%= preslist.get(i).getExaminedDate()%></td>
                                    <td><%= sd.getDoctorByDocID(preslist.get(i).getDoctorID()).getFname() + " " + sd.getDoctorByDocID(preslist.get(i).getDoctorID()).getLname()%></td>                                   
                                    <td><%= preslist.get(i).getDiagnosedWith()%></td>
                                    <td><a href="updatePrescription.jsp?presID=<%= preslist.get(i).getPrescriptionID()%>" class="btn btn-info">View</a></td>
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
        <script>
            function pop_up(name) {
                window.alert(name);
//                var standard = document.getElementById("standard");
//                standard.value = name;
                document.getElementById("standard").innerHTML = name;
            }
        </script>

        <!-- Menu Toggle Script -->
        <script>
            $("#menu-toggle").click(function (e) {
                e.preventDefault();
                $("#wrapper").toggleClass("toggled");
            });
        </script>
    </body>
</html>
