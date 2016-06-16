<%-- 
    Document   : updateFullBloodCount
    Created on : Jun 12, 2016, 6:09:30 PM
    Author     : Chandu Herath
--%>

<%@page import="Model.LabAssistant"%>
<%@page import="Controller.SearchLabAssistant"%>
<%@page import="Model.Patient"%>
<%@page import="Controller.SearchPatient"%>
<%@page import="Model.FullBloodCount"%>
<%@page import="Controller.SearchReports"%>
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
                            <%                                int bloodcountID = Integer.parseInt(request.getParameter("bloodcountID"));
                                SearchReports sr = new SearchReports();
                                FullBloodCount fbc = sr.getFullBloodCountByID(bloodcountID);
                                SearchPatient sp = new SearchPatient();
                                Patient p = sp.getPatientByPatientID(fbc.getPatient_id());
                                SearchLabAssistant sl = new SearchLabAssistant();
                                LabAssistant la = sl.getLabAssistantByLabAssistantID(fbc.getLabassistant_id());
                            %>
                            <form class="form-horizontal" action="SaveFullBloodCount" method="POST">
                                <table class="table table-bordered">
                                    <tr>
                                        <th colspan="20" style="text-align: center;font-size: medium" class="info">Full Blood Count</th>
                                    <tr>
                                    <tr>
                                        <td colspan="5" style="width: 25%" class="info"><b>Patient Name</b></td>
                                        <td colspan="15" style="width: 75%"><input name="pname" type="text" class="form-control" value="<%= p.getFname() + " " + p.getLname()%>"></td>                                   
                                    </tr>
                                    <tr>                                    
                                        <td colspan="5" style="width: 25%" class="info"><b>Referred By</b></td>
                                        <td colspan="15" style="width: 25%"><input name="referredBy" type="text" class="form-control" value="<%= la.getFname() + " " + la.getLname()%>"></td>
                                    </tr>
                                    <tr>
                                        <td colspan="5" style="width: 25%" class="info"><b>Issued Date</b></td>
                                        <td colspan="15" style="width: 25%"><input name="issued_date" type="date" class="form-control" value="<%= fbc.getIssued_date()%>"></td>
                                    </tr>

                                    <tr>
                                        <td colspan="4" style="width: 20%" class="info" ><b>Description</b></td>                   
                                        <td colspan="4" style="width: 20%" class="info"><b>Result</b></td>                    
                                        <td colspan="4" style="width: 20%" class="info"><b>Units</b></td> 
                                        <td colspan="4" style="width: 20%" class="info"><b>Reference Ranges</b> </td>                    
                                        <td colspan="4" style="width: 20%" class="info"><b>Remarks</b></td>   
                                    </tr>
                                    <tr>
                                        <td colspan="4" style="width: 20%" class="info" ><b>HAEMOGLOBIN</b></td>       
                                        <td colspan="4" style="width: 20%"><input name="haemoglobin" type="text" class="form-control"  maxlength="15" value="<%= fbc.getHaemoglobin()%>"></td>
                                        <td colspan="4" style="width: 20%" class="info" >g/dl</td>   
                                        <td colspan="4" style="width: 20%" class="info" >12.00 - 17.50</td>   
                                        <td colspan="4" style="width: 20%" class="info" >Description</td>   
                                    </tr>
                                    <tr>
                                        <td colspan="4" style="width: 20%" class="info" ><b>RBC</b></td>       
                                        <td colspan="4" style="width: 20%"><input name="rbc" type="text" class="form-control"  maxlength="15" value="<%= fbc.getRbc()%>"></td>
                                        <td colspan="4" style="width: 20%" class="info" >x10*6/mm3</td>   
                                        <td colspan="4" style="width: 20%" class="info" >3.50 - 6.00</td>   
                                        <td colspan="4" style="width: 20%" class="info" >Description</td>   
                                    </tr>

                                    <tr>
                                        <td colspan="4" style="width: 20%" class="info" ><b>PCV</b></td>       
                                        <td colspan="4" style="width: 20%"><input name="pcv" type="text" class="form-control"  maxlength="15" value="<%= fbc.getPvc()%>"></td>
                                        <td colspan="4" style="width: 20%" class="info" >%</td>   
                                        <td colspan="4" style="width: 20%" class="info" >36.00 - 50.00</td>   
                                        <td colspan="4" style="width: 20%" class="info" >Description</td>   
                                    </tr>
                                    <tr>
                                        <td colspan="4" style="width: 20%" class="info" ><b>MCV</b></td>       
                                        <td colspan="4" style="width: 20%"><input name="mcv" type="text" class="form-control"  maxlength="15" value="<%= fbc.getMvc()%>" ></td>
                                        <td colspan="4" style="width: 20%" class="info" >fl</td>   
                                        <td colspan="4" style="width: 20%" class="info" >70.00 - 96.00</td>   
                                        <td colspan="4" style="width: 20%" class="info" >Description</td>   
                                    </tr>
                                    <tr>
                                        <td colspan="4" style="width: 20%" class="info" ><b>MCH</b></td>       
                                        <td colspan="4" style="width: 20%"><input name="mch" type="text" class="form-control"  maxlength="15" value="<%= fbc.getMch()%>"></td>
                                        <td colspan="4" style="width: 20%" class="info" >pg</td>   
                                        <td colspan="4" style="width: 20%" class="info" >27.00 - 32.00</td>   
                                        <td colspan="4" style="width: 20%" class="info" >Description</td>   
                                    </tr>
                                    <tr>
                                        <td colspan="4" style="width: 20%" class="info" ><b>MCHC</b></td>       
                                        <td colspan="4" style="width: 20%"><input name="mchc" type="text" class="form-control"  maxlength="15" value="<%= fbc.getMchc()%>"></td>
                                        <td colspan="4" style="width: 20%" class="info" >g/dl</td>   
                                        <td colspan="4" style="width: 20%" class="info" >30.00 - 35.00</td>   
                                        <td colspan="4" style="width: 20%" class="info" >Description</td>   
                                    </tr>
                                    <tr>
                                        <td colspan="4" style="width: 20%" class="info" ><b>RDW-CV</b></td>       
                                        <td colspan="4" style="width: 20%"><input name="rdwcv" type="text" class="form-control"  maxlength="15" value="<%= fbc.getRdw_cv()%>" ></td>
                                        <td colspan="4" style="width: 20%" class="info" >%</td>   
                                        <td colspan="4" style="width: 20%" class="info" >11.60 - 14.00</td>   
                                        <td colspan="4" style="width: 20%" class="info" >Description</td>   
                                    </tr>
                                    <tr>
                                        <td colspan="4" style="width: 20%" class="info" ><b>PLATELET COUNT</b></td>       
                                        <td colspan="4" style="width: 20%"><input name="platelet" type="text" class="form-control"  maxlength="15" value="<%= fbc.getPlateletcount()%>"></td>
                                        <td colspan="4" style="width: 20%" class="info" >/mm3</td>   
                                        <td colspan="4" style="width: 20%" class="info" >150,000.00 - 450,000.00</td>   
                                        <td colspan="4" style="width: 20%" class="info" >Description</td>   
                                    </tr>
                                    <tr>
                                        <td colspan="4" style="width: 20%" class="info" ><b>WBC</b></td>       
                                        <td colspan="4" style="width: 20%"><input name="wbc" type="text" class="form-control"  maxlength="15" value="<%= fbc.getWbc()%>"></td>
                                        <td colspan="4" style="width: 20%" class="info" >/mm3</td>   
                                        <td colspan="4" style="width: 20%" class="info" >4000.00 - 11000.00</td>   
                                        <td colspan="4" style="width: 20%" class="info" >Description</td>   
                                    </tr>
                                    <tr>
                                        <td colspan="4" style="width: 20%" class="info" ><b>NEUTROPHILS</b></td>       
                                        <td colspan="4" style="width: 20%"><input name="neutrophils" type="text" class="form-control"  maxlength="15" value="<%= fbc.getNeutrophils()%>"></td>
                                        <td colspan="4" style="width: 20%" class="info" >%</td>   
                                        <td colspan="4" style="width: 20%" class="info" >40.00 - 75.00</td>   
                                        <td colspan="4" style="width: 20%" class="info" >Description</td>   
                                    </tr>
                                    <tr>
                                        <td colspan="4" style="width: 20%" class="info" ><b>LYMPHOCYTES</b></td>       
                                        <td colspan="4" style="width: 20%"><input name="lymphocytes" type="text" class="form-control"  maxlength="15" value="<%= fbc.getLymphocytes()%>"></td>
                                        <td colspan="4" style="width: 20%" class="info" >%</td>   
                                        <td colspan="4" style="width: 20%" class="info" >10.00 - 45.00</td>   
                                        <td colspan="4" style="width: 20%" class="info" >Description</td>   
                                    </tr>
                                    <tr>
                                        <td colspan="4" style="width: 20%" class="info" ><b>EOSINOPHILS</b></td>       
                                        <td colspan="4" style="width: 20%"><input name="eosinophils" type="text" class="form-control"  maxlength="15" value="<%= fbc.getEosinophil()%>" ></td>
                                        <td colspan="4" style="width: 20%" class="info" >%</td>   
                                        <td colspan="4" style="width: 20%" class="info" >1.00 - 6.00</td>   
                                        <td colspan="4" style="width: 20%" class="info" >Description</td>   
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
