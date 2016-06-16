<%-- 
    Document   : lipidprofile
    Created on : Jun 12, 2016, 9:43:50 AM
    Author     : Chandu Herath
--%>

<%@page import="Model.Patient"%>
<%@page import="Controller.SearchPatient"%>
<%@page import="Model.LabAssistant"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>HMSICARE</title>
        <%@include file="stylesAndScripts.jsp" %>
    </head>
    <body style="background-color: #eaf0f2">
        <%
            if (session.getAttribute("user") != null) {
                LabAssistant lassis = (LabAssistant) session.getAttribute("user");
                int userID = Integer.parseInt(request.getParameter("patientUserID"));
                SearchPatient sp = new SearchPatient();
                Patient p = sp.getPatientByUserID(userID);
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
                        <div class="col-md-8 col-md-offset-2" >
                            <form id="formlipidprofile" data-toggle="validator" class="form-horizontal" action="SaveLipidProfile" method="POST">
                                <table class="table table-bordered">
                                    <tr>
                                        <th colspan="20" style="text-align: center;font-size: medium" class="info">Lipid Profile</th>
                                    <tr>
                                    <tr>
                                        <td colspan="5" style="width: 25%" class="info"><b>Patient Name</b></td>
                                        <td colspan="15" style="width: 75%" class="form-group"><input name="pname" type="text" class="form-control" value="<%= p.getFname()+ " " + p.getLname() %>" disabled=""></td>                              
                                    </tr>
                                    <tr>                             
                                        <td colspan="5" style="width: 25%" class="info"><b>Referred By</b></td>
                                        <td colspan="15" style="width: 75%" class="form-group"><input name="referredBy" type="text" class="form-control" value="<%= lassis.getFname()+ " " + lassis.getLname() %>" disabled=""></td>
                                    </tr>
                                    <tr>
                                        <td colspan="5" style="width: 25%" class="info"><b>Issued Date</b></td>
                                        <td colspan="15" style="width: 75%" class="form-group"><input name="issued_date" type="date" class="form-control" placeholder="Issued Date" required=""></td>
                                    </tr>

                                    <tr>
                                        <td colspan="4" style="width: 20%" class="info" ><b>Description</b></td>                   
                                        <td colspan="4" style="width: 20%" class="info"><b>Result</b></td>                    
                                        <td colspan="4" style="width: 20%" class="info"><b>Units</b></td> 
                                        <td colspan="4" style="width: 20%" class="info"><b>Reference Ranges</b> </td>                    
                                        <td colspan="4" style="width: 20%" class="info"><b>Remarks</b></td>   
                                    </tr>
                                    <tr>
                                        <td colspan="4" style="width: 20%" class="info" ><b>CHOLESTEROL TOTAL</b></td>       
                                        <td colspan="4" style="width: 20%" class="form-group"><input name="total" type="text" class="form-control"  maxlength="15" pattern="[0-9]*(\.[0-9]+)?" required=""></td>
                                        <td colspan="4" style="width: 20%" class="info" >mg/dl</td>   
                                        <td colspan="4" style="width: 20%" class="info" >< 200.00</td>   
                                        <td colspan="4" style="width: 20%" class="info" >NORMAL</td>   
                                    </tr>
                                    <tr>
                                        <td colspan="4" style="width: 20%" class="info" ><b>CHOLESTEROL HDL</b></td>       
                                        <td colspan="4" style="width: 20%" class="form-group"><input name="hdl" type="text" class="form-control"  maxlength="15" pattern="[0-9]*(\.[0-9]+)?" required=""></td>
                                        <td colspan="4" style="width: 20%" class="info" >mg/dl</td>   
                                        <td colspan="4" style="width: 20%" class="info" >>= 45.00</td>   
                                        <td colspan="4" style="width: 20%" class="info" >NORMAL</td>   
                                    </tr>

                                    <tr>
                                        <td colspan="4" style="width: 20%" class="info" ><b>TRIGLYCERIDES</b></td>       
                                        <td colspan="4" style="width: 20%" class="form-group"><input name="tryglycerides" type="text" class="form-control"  maxlength="15" pattern="[0-9]*(\.[0-9]+)?" required=""></td>
                                        <td colspan="4" style="width: 20%" class="info" >mg/dl</td>   
                                        <td colspan="4" style="width: 20%" class="info" >< 150.00</td>   
                                        <td colspan="4" style="width: 20%" class="info" >NORMAL</td>   
                                    </tr>
                                    <tr>
                                        <td colspan="4" style="width: 20%" class="info" ><b>CHOLESTEROL LDL</b></td>       
                                        <td colspan="4" style="width: 20%" class="form-group"><input name="ldl" type="text" class="form-control"  maxlength="15" pattern="[0-9]*(\.[0-9]+)?" required=""></td>
                                        <td colspan="4" style="width: 20%" class="info" >mg/dl</td>   
                                        <td colspan="4" style="width: 20%" class="info" >< 160.00</td>   
                                        <td colspan="4" style="width: 20%" class="info" >NORMAL</td>   
                                    </tr>
                                    <tr>
                                        <td colspan="4" style="width: 20%" class="info" ><b>VLDL CHOLESTEROL</b></td>       
                                        <td colspan="4" style="width: 20%" class="form-group"><input name="vldl" type="text" class="form-control"  maxlength="15" pattern="[0-9]*(\.[0-9]+)?" required=""></td>
                                        <td colspan="4" style="width: 20%" class="info" >mg/dl</td>   
                                        <td colspan="4" style="width: 20%" class="info" >< 40.00</td>   
                                        <td colspan="4" style="width: 20%" class="info" >NORMAL</td>   
                                    </tr>
                                    <tr>
                                        <td colspan="4" style="width: 20%" class="info" ><b>TOTAL CHOLESTEROL/HDL RATIO</b></td>       
                                        <td colspan="4" style="width: 20%" class="form-group"><input name="ratio" type="text" class="form-control"  maxlength="15" pattern="[0-9]*(\.[0-9]+)?" required=""></td>
                                        <td colspan="12" style="width: 60%" class="info" ></td>   
                                    </tr>

                                </table>      

                                <input id="patientID" name="patientID" type="hidden" value="<%= p.getPatient_id()%>">
                                <input id="labassisID" name="labassisID" type="hidden" value="<%= lassis.getLab_assis_id()%>">
                                <input id="userID" name="userID" type="hidden" value="<%= p.getUserId()%>">
                                
                                <a href="createReport.jsp?patientUserID=<%= userID %>" class="btn btn-info">Cancel</a>
                                <button type="submit" class="btn btn-info"> Save </button>
                            </form>
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
            $('#formlipidprofile').validator();
        </script>
    </body>
</html>
