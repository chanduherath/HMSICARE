<%-- 
    Document   : updatePrescription
    Created on : Jun 11, 2016, 7:10:13 PM
    Author     : Chandu Herath
--%>

<%@page import="Model.Patient"%>
<%@page import="Controller.SearchPatient"%>
<%@page import="Model.Prescription"%>
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
                        <div class="col-md-12">
                            <div class="col-md-8 col-md-offset-2">
                                <%                                    int presID = Integer.parseInt(request.getParameter("presID"));
                                    DBDataList dl = new DBDataList();
                                    Prescription p = dl.getPrescriptionByID(presID);
                                    System.out.println(p.getDrug1());
                                    System.out.println(p.getDrug2());
                                    System.out.println(p.getDrug3());
                                    System.out.println(p.getDrug4());
                                    System.out.println(p.getDrug5());
                                    String[] drug1 = p.getDrug1().split("/");
                                    System.out.println(drug1.length);
                                    String[] drug2 = p.getDrug2().split("/");
                                    System.out.println(drug2.length);
                                    String[] drug3 = p.getDrug3().split("/");
                                    System.out.println(drug3.length);
                                    String[] drug4 = p.getDrug4().split("/");
                                    System.out.println(drug4.length);
                                    String[] drug5 = p.getDrug5().split("/");
                                    System.out.println(drug5.length);
                                    System.out.println(drug5[0]);
                                    System.out.println(drug5[1]);

                                    SearchPatient sp = new SearchPatient();
                                    Patient pt = sp.getPatientByPatientID(p.getPatientID());
                                %>
                                <form class="form-horizontal" action="" method="POST">
                                    <table class="table table-bordered ">
                                        <tr>
                                            <th colspan="12" style="text-align: center" class="info"> Medical Prescription</th>
                                        <tr>

                                        <tr>
                                            <td colspan="6" style="width: 50%" class="info">Name of the Patient</td>                    
                                            <td colspan="6" style="width: 50%"><label class = "control-label"><%= pt.getFname() + " " + pt.getLname()%></label></td>
                                        </tr>

                                        <tr>
                                            <td colspan="3" style="width: 25%" class="info">Date of Birth</td>
                                            <td colspan="3" style="width: 25%"><label class = "control-label">04.05.1993</label></td>
                                            <td colspan="3" style="width: 25%" class="info">Age</td>
                                            <td colspan="3" style="width: 25%"><label class = "control-label">23</label></td>
                                        </tr>

                                        <tr>
                                            <td colspan="6" style="width: 50%" class="info">Date</td>
                                            <td colspan="6" style="width: 50%"><input name="date" type="date" class="form-control" value="<%= p.getExaminedDate()%>"></td>
                                        </tr> 

                                        <tr>
                                            <td colspan="3" style="width: 25%" class="info">Diagnosed With</td>
                                            <td colspan="9" style="width: 75%"><input name="diagnosed" type="text" class="form-control" placeholder="Diagnosed With" maxlength="20" value="<%= p.getDiagnosedWith()%>" ></td>
                                        </tr>
                                        <tr>
                                            <td colspan="3" style="width: 25%" class="info">Blood Pressure</td>
                                            <td colspan="3" style="width: 25%"><input name="pressure" type="text" class="form-control" placeholder="Blood Pressure" value="<%= p.getBloodPressure()%>"></td>
                                            <td colspan="3" style="width: 25%" class="info">Pulse Rate</td>
                                            <td colspan="3" style="width: 25%"><input name="pulseRate" type="text" class="form-control" placeholder="Pulse Rate" value="<%= p.getPulserate()%>"></td>
                                        </tr>
                                        <tr>
                                            <td colspan="4" style="width: 33%" class="info" >Drug</td>                   
                                            <td colspan="4" style="width: 34%" class="info">Unit(Tablet or Syrup)</td>                    
                                            <td colspan="4" style="width: 33%" class="info">Dosage(Per Day)</td>                  
                                        </tr>
                                        <tr>
                                            <td colspan="4" style="width: 33%"><input name="drug1" type="text" class="form-control"  maxlength="15" value="<%= drug1[0]%>"></td>
                                            <td colspan="4" style="width: 34%"><input name="unit1" type="text" class="form-control" value="<%= drug1[1]%>" ></td>
                                            <td colspan="4" style="width: 33%"><input name="dosage1" type="text" class="form-control" value="<%= drug1[2]%>"></td>
                                        </tr>
                                        <tr>
                                            <td colspan="4" style="width: 33%"><input name="drug2" type="text" class="form-control"  maxlength="15" value="<%= drug2[0]%>"></td>
                                            <td colspan="4" style="width: 34%"><input name="unit2" type="text" class="form-control" value="<%= drug2[1]%>"></td>
                                            <td colspan="4" style="width: 33%"><input name="dosage2" type="text" class="form-control" value="<%= drug2[2]%>"</td>
                                        </tr>
                                        <tr>
                                            <td colspan="4" style="width: 33%"><input name="drug3" type="text" class="form-control"  maxlength="15" value="<%= drug3[0]%>"></td>
                                            <td colspan="4" style="width: 34%"><input name="unit3" type="text" class="form-control" value="<%= drug3[1]%>"></td>
                                            <td colspan="4" style="width: 33%"><input name="dosage3" type="text" class="form-control" value="<%= drug3[2]%>"></td>
                                        </tr>
                                        <tr>
                                            <td colspan="4" style="width: 33%"><input name="drug4" type="text" class="form-control"  maxlength="15" value="<%= drug4[0]%>"></td>
                                            <td colspan="4" style="width: 34%"><input name="unit4" type="text" class="form-control" value="<%= drug4[1]%>" ></td>
                                            <td colspan="4" style="width: 33%"><input name="dosage4" type="text" class="form-control" value="<%= drug4[2]%>"></td>
                                        </tr>
                                        <tr>
                                            <td colspan="4" style="width: 33%"><input name="drug5" type="text" class="form-control"  maxlength="15" value="<%= drug5[0]%>"></td>
                                            <td colspan="4" style="width: 34%"><input name="unit5" type="text" class="form-control" value="<%= drug5[1]%>" ></td>
                                            <td colspan="4" style="width: 33%"><input name="dosage5" type="text" class="form-control" value="<%= drug5[2]%>"></td>
                                        </tr>

                                        <tr>
                                            <td colspan="3" style="width: 25%" class="info">Examination to be done(if any)</td>                
                                            <td colspan="9" style="width: 75%"><input name="tests" type="text" class="form-control" placeholder="Any Tests?" maxlength="20" value="<%= p.getRecomendedTest()%>"></td>
                                        </tr>
                                        <tr>
                                            <td colspan="3" style="width: 25%" class="info">Things to Follow</td>
                                            <td colspan="9" style="width: 75%"><input name="follow" type="text" class="form-control" placeholder="Things to Follow?" maxlength="20" value="<%= p.getThingsToFollow()%>"></td></td>
                                        </tr>


                                    </table>

                                    <a href="reportList.jsp?patientID=<%= pt.getPatient_id()%>" class="btn btn-info">Back</a> 
                                </form>
                            </div>
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
