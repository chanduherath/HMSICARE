<%-- 
    Document   : patientProfile
    Created on : Jun 3, 2016, 12:46:16 PM
    Author     : Chandu Herath
--%>

<%@page import="Model.Patient"%>
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
                User us12 = (User) session.getAttribute("user");
                int userID = Integer.parseInt(request.getParameter("patientUserID"));
                SearchPatient sp = new SearchPatient();
                Patient pt = sp.getPatientByUserID(userID);
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
                        <div class="box-body col-md-12" style="border-style: solid;border-left-color: #204d74;border-bottom: none;border-right: none;border-top: none;padding-top: 40px;padding-bottom: 30px;background-color: whitesmoke">
                            <div class="row">
                                <div class="col-md-3 center-block">
                                    <img src="img/userA.png" class="center-block" alt="profile picture" height="200" width="200"/>
                                </div>
                                <div class="col-md-9">
                                    <div class="row">
                                        <label class="control-label col-md-3">FIRST NAME</label>
                                        <label class="control-label col-md-9"><%= pt.getFname()%></label>                  
                                    </div>

                                    <div class="row">   
                                        <label class="control-label col-md-3">LAST NAME</label>
                                        <label class="control-label col-md-9"><%= pt.getLname()%></label> 
                                    </div>
                                    <div class="row">     
                                        <label class="control-label col-md-3">NIC NUMBER</label>
                                        <label class="control-label col-md-9"><%= pt.getNic()%></label> 
                                    </div>    

                                    <div class="row">
                                        <label class="control-label col-md-3">ADDRESS</label>
                                        <label class="control-label col-md-9"><%= pt.getAddress()%></label> 
                                    </div>

                                    <div class="row">
                                        <label class="control-label col-md-3">E-MAIL</label>
                                        <label class="control-label col-md-9"><%= pt.getEmail()%></label> 
                                    </div>
                                    <div class="row">
                                        <label class="control-label col-md-3">Description</label>
                                        <label class="control-label col-md-9"><%= pt.getDescription()%></label> 
                                    </div>
                                    <div class="row">
                                        <label class="control-label col-md-3">WARD NUMBER</label>
                                        <label class="control-label col-md-9"><%= pt.getWard_number()%></label> 
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row" style="border-style: solid;border-left-color: #204d74;border-bottom: none;border-right: none;border-top: none;background-color: whitesmoke;margin-top:20px ">
                        <div class="col-md-12" >
                            <div class="col-md-4" style="height: 100px;margin-top:20px;margin-bottom: 20px;">
                                <a href="reportList.jsp?patientID=<%= pt.getPatient_id()%>">
                                    <div class="center-block col-md-12" style="height: 100px;background-color: #d020e9;">
                                        <img src="img/report.png" class="col-md-3 center-block" alt="lab report" style="margin-top: 25px">
                                        <h3 class="col-md-9" style="color: black">View Lab Reports</h3>
                                    </div>
                                </a>
                            </div>
                            <div class="col-md-4" style="height: 100px;margin-top:20px;margin-bottom: 20px;">
                                <a href="prescriptionList.jsp?patientID=<%= pt.getPatient_id()%>">
                                    <div class="center-block col-md-12" style="height: 100px;background-color: #c5e3f7;">
                                        <img src="img/prescription.png" class="col-md-3 center-block" alt="prescription" style="margin-top: 25px">
                                        <h3 class="col-md-9" style="color: black">View Past Medical History</h3>
                                    </div>
                                </a>
                            </div>
                            <%
                                if (us12.getUserLevel().equals("Doctor")) {
                            %>
                            <div class="col-md-4" style="height: 100px;margin-top:20px;margin-bottom: 20px">                             
                                <a href="prescription.jsp?patientUserID=<%= pt.getUserId()%>">
                                    <div class="center-block  col-md-12" style="height: 100px;background-color: #e00d80">
                                        <img src="img/addNewItem.png" class="col-md-4 center-block" alt="add new" style="margin-top: 10px">
                                        <h3 class="col-md-8" style="color: black">Create New Prescription</h3>
                                    </div>
                                </a>
                            </div>
                            <%
                                }
                                if (us12.getUserLevel().equals("LabAssistant")) {
                            %>
                            <div class="col-md-4" style="height: 100px;margin-top:20px;margin-bottom: 20px"> 
                                <a href="createReport.jsp?patientUserID=<%= pt.getUserId()%>">
                                    <div class="center-block  col-md-12" style="height: 100px;background-color: #e00d80">
                                        <img src="img/addNewItem.png" class="col-md-4 center-block" alt="add new" style="margin-top: 10px">
                                        <h3 class="col-md-8" style="color: black">Create New Report</h3>
                                    </div>
                                </a>
                            </div>
                            <%
                                }
                            %>

                        </div>                       
                    </div>
                    <br>

                    <%
                        if (request.getParameter("msg") != null) {
                            if (request.getParameter("msg").equals("error")) {
                    %>
                    <div class="row alert" style="background-color: #cc2626">
                        <strong>Warning!</strong> Oops..! Something Went Wrong. Please Try Again.
                    </div>
                    <%
                    } else if (request.getParameter("msg").equals("success")) {
                    %>
                    <div class="row alert" style="background-color: #13911a">
                        <strong>Success!</strong> The Document saved successfully.
                    </div>

                    <%
                            }
                        }
                    %>
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
