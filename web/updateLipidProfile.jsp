<%-- 
    Document   : updateLipidProfile
    Created on : Jun 12, 2016, 6:41:48 PM
    Author     : Chandu Herath
--%>

<%@page import="Model.LabAssistant"%>
<%@page import="Controller.SearchLabAssistant"%>
<%@page import="Model.Patient"%>
<%@page import="Controller.SearchPatient"%>
<%@page import="Model.LipidProfile"%>
<%@page import="Controller.SearchReports"%>
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
                        <div class="col-md-8 col-md-offset-2" >
                             <%
                                int lipidprofileID = Integer.parseInt(request.getParameter("lipidprofileID"));
                                SearchReports sr = new SearchReports();
                                LipidProfile lp = sr.getLipidProfileByID(lipidprofileID);
                                SearchPatient sp = new SearchPatient();
                                Patient p = sp.getPatientByPatientID(lp.getPatient_id());
                                SearchLabAssistant sl = new SearchLabAssistant();
                                LabAssistant la = sl.getLabAssistantByLabAssistantID(lp.getLabassistant_id());
                                
                                %>
                            <form class="form-horizontal" action="SaveLipidProfile" method="POST">
                                <table class="table table-bordered">
                                    <tr>
                                        <th colspan="20" style="text-align: center;font-size: medium" class="info">Lipid Profile</th>
                                    <tr>
                                    <tr>
                                        <td colspan="5" style="width: 25%" class="info"><b>Patient Name</b></td>
                                        <td colspan="15" style="width: 75%"><input name="pname" type="text" class="form-control" value="<%= p.getFname()+ " " +p.getLname() %>"></td>                                   
                                    </tr>
                                    <tr>                                    
                                        <td colspan="5" style="width: 25%" class="info"><b>Referred By</b></td>
                                        <td colspan="15" style="width: 25%"><input name="referredBy" type="text" class="form-control" value="<%= la.getFname() + " " + la.getLname() %>"></td>
                                    </tr>
                                    <tr>
                                        <td colspan="5" style="width: 25%" class="info"><b>Issued Date</b></td>
                                        <td colspan="15" style="width: 25%"><input name="issued_date" type="date" class="form-control" value="<%= lp.getIssued_date() %>"></td>
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
                                        <td colspan="4" style="width: 20%"><input name="total" type="text" class="form-control"  maxlength="15" value="<%= lp.getCho_total() %>" ></td>
                                        <td colspan="4" style="width: 20%" class="info" >mg/dl</td>   
                                        <td colspan="4" style="width: 20%" class="info" >< 200.00</td>   
                                        <td colspan="4" style="width: 20%" class="info" >NORMAL</td>   
                                    </tr>
                                    <tr>
                                        <td colspan="4" style="width: 20%" class="info" ><b>CHOLESTEROL HDL</b></td>       
                                        <td colspan="4" style="width: 20%"><input name="hdl" type="text" class="form-control"  maxlength="15" value="<%= lp.getCho_hdl() %>"></td>
                                        <td colspan="4" style="width: 20%" class="info" >mg/dl</td>   
                                        <td colspan="4" style="width: 20%" class="info" >>= 45.00</td>   
                                        <td colspan="4" style="width: 20%" class="info" >NORMAL</td>   
                                    </tr>

                                    <tr>
                                        <td colspan="4" style="width: 20%" class="info" ><b>TRIGLYCERIDES</b></td>       
                                        <td colspan="4" style="width: 20%"><input name="tryglycerides" type="text" class="form-control"  maxlength="15" value="<%= lp.getTriglyverides() %>"></td>
                                        <td colspan="4" style="width: 20%" class="info" >mg/dl</td>   
                                        <td colspan="4" style="width: 20%" class="info" >< 150.00</td>   
                                        <td colspan="4" style="width: 20%" class="info" >NORMAL</td>   
                                    </tr>
                                    <tr>
                                        <td colspan="4" style="width: 20%" class="info" ><b>CHOLESTEROL LDL</b></td>       
                                        <td colspan="4" style="width: 20%"><input name="ldl" type="text" class="form-control"  maxlength="15" value="<%= lp.getCho_ldl() %>"></td>
                                        <td colspan="4" style="width: 20%" class="info" >mg/dl</td>   
                                        <td colspan="4" style="width: 20%" class="info" >< 160.00</td>   
                                        <td colspan="4" style="width: 20%" class="info" >NORMAL</td>   
                                    </tr>
                                    <tr>
                                        <td colspan="4" style="width: 20%" class="info" ><b>VLDL CHOLESTEROL</b></td>       
                                        <td colspan="4" style="width: 20%"><input name="vldl" type="text" class="form-control"  maxlength="15" value="<%= lp.getVldl() %>"></td>
                                        <td colspan="4" style="width: 20%" class="info" >mg/dl</td>   
                                        <td colspan="4" style="width: 20%" class="info" >< 40.00</td>   
                                        <td colspan="4" style="width: 20%" class="info" >NORMAL</td>   
                                    </tr>
                                    <tr>
                                        <td colspan="4" style="width: 20%" class="info" ><b>TOTAL CHOLESTEROL/HDL RATIO</b></td>       
                                        <td colspan="4" style="width: 20%"><input name="ratio" type="text" class="form-control"  maxlength="15" value="<%= lp.getRatio() %>"></td>
                                        <td colspan="12" style="width: 60%" class="info" ></td>   
                                    </tr>

                                </table>      
                                        
                                <a href="reportList.jsp?patientID=<%= p.getPatient_id() %>" class="btn btn-info">Back</a>
                                <!--<button type="submit" class="btn btn-info"> Save </button>-->
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
        </script>
    </body>
</html>
